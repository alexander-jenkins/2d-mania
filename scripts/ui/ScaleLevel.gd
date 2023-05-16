extends Node2D

var pmonster := preload("res://scenes/objects/enemies/Long.tscn")

@onready var buttons := $Buttons
@onready var clock := $CanvasLayer/Control/Label
@onready var timer := $CanvasLayer/Control/Timer
@onready var title := $CanvasLayer/Control/Label2

@onready var Tir := $Triangle
@onready var startCl := $Timer

@onready var left := $monsterSpawn/left
@onready var right := $monsterSpawn/right
@onready var up := $monsterSpawn/up
@onready var down := $monsterSpawn/down
@onready var Ratetime := $rate
@export var fireRate := 3.5

var level = [
	"res://scenes/levels/translate_level.tscn",
	"res://scenes/levels/RotateLevel.tscn",
	"res://scenes/levels/reflection_level.tscn"
]

var speedx = 800
var speedy = 700
var side = -1

var x: int = 10
var death: bool = false
var Monster: bool = false

func _ready():
# warning-ignore:return_value_discarded
	Signals.connect("deaded", Callable(self, "_deaded"))
	var score = Score.returnSocre()
	if score > 5:
		speedx = 800
		speedy = 700
		fireRate = 3
	elif score > 10:
		speedx = 900
		speedy = 900
		fireRate = 2.9
	elif score > 18:
		speedx = 1000
		speedy = 1000
		fireRate = 2.8
	elif score > 26:
		speedx = 1100
		speedy = 1200
		fireRate = 2.6
	elif score > 34:
		speedx = 1200
		speedy = 1300
		fireRate = 2.5
	
	title.hide()
	buttons.hide()
	clock.text = str(x)
	startCl.start(0.8)
	timer.start(1)
	
	randomize()
	var start = randf_range(0,100)
	if start < 50:
		side = 1
	else:
		side = -1

func _physics_process(_delta):
	if startCl.is_stopped():
		if Ratetime.is_stopped() and Monster != true:
			if side == -1:
				fireHor()
				side *= -1
			else:
				fireVer()
				side *= -1
			Ratetime.start(fireRate)

func fireHor():
	var rang = randf_range(-100,100)
	
	var Rmonster := pmonster.instantiate()
	Rmonster.global_position = right.global_position
	Rmonster.UpORDown = false
	Rmonster.position.y += rang 
	Rmonster.direction = -1
	Rmonster.speedx = speedx
	get_tree().current_scene.add_child(Rmonster)
	
	var Lmonster := pmonster.instantiate()
	Lmonster.global_position = left.global_position
	Lmonster.UpORDown = false
	Lmonster.position.y += rang * -1
	Lmonster.direction = 1
	Lmonster.speedx = speedx
	get_tree().current_scene.add_child(Lmonster)

func fireVer():
	
	var rang = randf_range(-100,50)
	
	var Umonster := pmonster.instantiate()
	Umonster.global_position = up.global_position
	Umonster.UpORDown = true
	Umonster.direction = 1
	Umonster.position.x += rang 
	Umonster.speedx = speedy
	get_tree().current_scene.add_child(Umonster)
	
	var Dmonster := pmonster.instantiate()
	Dmonster.global_position = down.global_position
	Dmonster.direction = -1
	Dmonster.position.x += rang * -1
	Dmonster.UpORDown = true
	Dmonster.speedx = speedy
	get_tree().current_scene.add_child(Dmonster)

func _process(_delta):
	if timer.is_stopped() and x >= 1:
		x -= 1
		clock.text = str(x)
		timer.start(1)
	if x <= 0 and death == false:
		nextLevel()

func nextLevel():
	var z = randi_range(0,2)
	Monster = true
	get_tree().call_group("Emeny", "queue_free")
	clock.hide()
	title.show()
	title.text = str("YOU WIN")
	Score._scoreIncrease(1)
# warning-ignore:return_value_discarded
	match z:
		0:
			SceneTransition.change_scene_to_file("res://scenes/levels/translate_level.tscn", "poly")
		1:
			SceneTransition.change_scene_to_file("res://scenes/levels/RotateLevel.tscn", "circle")
		2:
			SceneTransition.change_scene_to_file("res://scenes/levels/reflection_level.tscn", "rect")

func _deaded():
	death = true
	Monster = true
	buttons.show()
	Score.stopMusic()
	clock.hide()
	title.show()
	title.text = str("YOU LOSE")
