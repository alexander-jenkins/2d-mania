extends Area2D

@export var path = ""

func _ready():
	$Sprite2D.play("normal")

func _input(event):
	if event.is_action_pressed("Confirm"):
		find_and_use_dialogue()
	
func find_and_use_dialogue():
	var dialogue_player = get_node_or_null("DialoguePlayer")
	
	if dialogue_player:
		dialogue_player.play()
	
	if dialogue_player.move_on_scene == true:
		SceneTransition.change_scene_to_file(path, "dissolve")
	
	if dialogue_player.emotion == 1:
		$Sprite2D.play("normal")
	elif dialogue_player.emotion == 2:
		$Sprite2D.play("smile")
	elif dialogue_player.emotion == 3:
		$Sprite2D.play("see")
	elif dialogue_player.emotion == 4:
		$Sprite2D.play("angry")

func _process(_delta):
	pass

