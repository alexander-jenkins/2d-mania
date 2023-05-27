extends Node2D

@onready var scene = get_tree().current_scene
@onready var timer = $Timer
@onready var win_state = $Control/Label2
@onready var clock = $Control/Label
@onready var Buttons := $Buttons
@onready var alive = true
@onready var total_time = 11
@onready var spawns = [ 
		$spawn_origin/up, 
		$spawn_origin/down,
		$spawn_origin/left,
		$spawn_origin/right, 
		$spawn_origin/top_left, 
		$spawn_origin/top_right, 
		$spawn_origin/bottom_left, 
		$spawn_origin/bottom_right
	]
var level = [
	"res://scenes/levels/ScaleLevel.tscn",
	"res://scenes/levels/RotateLevel.tscn",
	"res://scenes/levels/translate_level.tscn"
]
@onready var enemy := preload("res://scenes/objects/enemies/Small.tscn")

func _ready():
	randomize()
	Buttons.hide()
	clock.text = str(total_time)
	win_state.hide()
	print("Bottom left: ", $game_origin/bottom_left.global_position)
	print("Top left: ", $game_origin/top_left.global_position)
	print("Top right: ", $game_origin/top_right.global_position)
	print("Bottom right: ", $game_origin/bottom_right.global_position)
	Signals.connect("deaded", Callable(self, "_deaded"))

func _process(_delta):
	var player = get_node_or_null("Rectangle")
	if player == null:
		alive = false
	if not alive:
		pass
	if timer.is_stopped() and total_time >= 0 and player != null:
		total_time -= 1
		clock.text = str(total_time)
		timer.start(1)
		if total_time % 3 == 0:
			spawnNextEnemy()
			pass
	elif total_time <= 0:
		var z = randi_range(0,2)
		get_tree().call_group("Emeny", "queue_free")
		Score._scoreIncrease(1)
		match z:
			0:
				SceneTransition.change_scene_to_file(level[0], "triangle")
			1:
				SceneTransition.change_scene_to_file(level[1], "circle")
			2:
				SceneTransition.change_scene_to_file(level[2], "poly")
	pass
	
func _deaded():
	Score.stopMusic()
	win_state.show()
	Buttons.show()

func gameover():
	Score.stopMusic()
	win_state.show()
	Buttons.show()


func spawnNextEnemy():
	spawns.shuffle()
	var point = spawns.pop_front()
	print("Spawning at ", point)
	var next := enemy.instantiate()
	next.global_position = point.global_position
	var playerLoc = $Rectangle.global_position
	next.look_at(playerLoc)
	var dir = point.global_position.direction_to(Vector2(playerLoc))
	next.direction = dir
	scene.add_sibling(next)
	pass
