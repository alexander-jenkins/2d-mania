extends Node2D

# Node references
@onready var scene = get_tree().current_scene
@onready var timer = $Timer
@onready var win_state = $Control/Label2
@onready var clock = $Control/Label
@onready var Buttons := $Buttons
@onready var enemy := preload("res://scenes/objects/enemies/Small.tscn")
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
	"res://scenes/levels/reflection_level.tscn"
]
@onready var alive = true

# Settings
@export var totalTime = 11

func _ready():
	Signals.connect("deaded", Callable(self, "_deaded"))
	clock.text = str(totalTime)
	win_state.hide()
	Buttons.hide()

func _process(_delta):
	var player = get_node_or_null("Polygon")
	if player == null:
		alive = false
	if not alive:
		pass
	if timer.is_stopped() and totalTime >= 0 and player != null:
		totalTime -= 1
		clock.text = str(totalTime)
		timer.start(1)
		if totalTime % 3 == 0:
			spawnNextEnemy()
	elif totalTime == 0:
		var z = randi_range(0,2)
		get_tree().call_group("Emeny", "queue_free")
		Score._scoreIncrease(1)
		match z:
			0:
				SceneTransition.change_scene_to_file(level[0], "triangle")
			1:
				SceneTransition.change_scene_to_file(level[1], "circle")
			2:
				SceneTransition.change_scene_to_file(level[2], "rect")
	pass

func _deaded():
	Score.stopMusic()
	win_state.show()
	Buttons.show()

func spawnNextEnemy():
	spawns.shuffle()
	var point = spawns.pop_front()
	var next := enemy.instantiate()
	next.global_position = point.global_position
	var playerLoc = $Polygon.global_position
	next.look_at(playerLoc)
	var dir = point.global_position.direction_to(Vector2(playerLoc))
	next.direction = dir
	scene.add_sibling(next)
	pass
