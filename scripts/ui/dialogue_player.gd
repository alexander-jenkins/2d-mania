extends CanvasLayer

@export var dialogue_file: String = ""

var dialogues = []
var current_dialogue_id = 0
var is_dialogue_active = false
@export var move_on_scene = false
@export var emotion = 1

func _ready():
	$NinePatchRect.visible = false
	

func play():
	if is_dialogue_active:
		return
	
	dialogues = load_dialogue()
	is_dialogue_active = true
	$NinePatchRect.visible = true
	current_dialogue_id = -1
	next_line()

func _input(event):
	if not is_dialogue_active:
		return
	
	if event.is_action_pressed("Confirm"):
		next_line()


func next_line():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogues):
		$Timer.start(0.6)
		$NinePatchRect.visible = false
		move_on_scene = true
		return
	
	$NinePatchRect/Name.text = str(dialogues[current_dialogue_id]["name"])
	$NinePatchRect/Message.text = str(dialogues[current_dialogue_id]["text"])
	emotion = dialogues[current_dialogue_id]["emotion"]
	#print(emotion)

func load_dialogue():
	var file = FileAccess.open(dialogue_file,FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content


func _on_timer_timeout():
	is_dialogue_active = false
