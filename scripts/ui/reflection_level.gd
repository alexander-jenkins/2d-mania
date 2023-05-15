extends Node2D

@onready var scene = get_tree().current_scene
@onready var timer = $Timer
@onready var win_state = $Control/Label2
@onready var clock = $Control/Label
@onready var alive = true
@onready var total_time = 10

func _ready():
	clock.text = str(total_time)
	win_state.hide()
	print("Bottom left: ", $game_origin/bottom_left.global_position)
	print("Top left: ", $game_origin/top_left.global_position)
	print("Top right: ", $game_origin/top_right.global_position)
	print("Bottom right: ", $game_origin/bottom_right.global_position)
	pass

func _process(_delta):
	var player = get_node_or_null("Rectangle")
	if not alive:
		win_state.show()
	if timer.is_stopped() and total_time >= 0 and player != null:
		clock.text = str(total_time)
		total_time -= 1
		timer.start(1)
		if total_time % 3 == 0:
			#spawnNextEnemy()
			pass
	elif total_time == 0:
		print("You win!")
	pass
