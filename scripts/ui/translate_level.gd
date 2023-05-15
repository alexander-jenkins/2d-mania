extends Node2D

# Node references
@onready var scene = get_tree().current_scene
@onready var timer = $Timer
@onready var win_state = $Control/Label2
@onready var clock = $Control/Label
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
@onready var alive = true

# Settings
@export var totalTime = 10

func _ready():	
	clock.text = str(totalTime)
	win_state.hide()
	pass

func _process(_delta):
	var player = get_node_or_null("Polygon")	
	if not alive:
		win_state.show()
	if timer.is_stopped() and totalTime >= 0 and player != null:
		clock.text = str(totalTime)
		totalTime -= 1
		timer.start(1)
		if totalTime % 3 == 0:
			spawnNextEnemy()
	elif totalTime == 0:
		print("You win!")
	pass

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
