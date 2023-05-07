extends Area2D
@export var Hspin = 0
@export var spin = 200
@export var turn = 1
@export var Min = 1
@export var Max = 2
@onready var rate := $turnrate
@onready var wait := $waitTime
@onready var stop := $stopTime
@onready var anime := $AnimatedSprite2D
var start: bool = false
var object: Player = null
@export var turnRate = 0.7

func _ready():
	anime.play("default")
	Hspin = spin
	wait.start(1)
	randomize()
	var x = randf_range(0,100)
	if x <= 50:
		turn = 1
	else:
		turn = -1

func _process(delta):
	if rate.is_stopped():
		spin = 0
		stop.start(turnRate)
		turn *= -1
		rate.start(randf_range(Min,Max))
	if start == true:
		rotation_degrees += spin * turn * delta 
	if object != null:
		start = false
		$sound.play()
		anime.play("bit")
		object.death()


func _on_Large_area_entered(area):
	if area is Player:
		object = area



func _on_Large_area_exited(area):
	if area is Player:
		object = null


func _on_waitTime_timeout():
	start = true



func _on_stopTime_timeout():
	spin = Hspin
