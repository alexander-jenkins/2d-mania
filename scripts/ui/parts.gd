extends Area2D

@export var minSpeed = 180
@export var maxSpeed = 200
@export var minSpin = -20
@export var maxSpin = 20
@onready var anime := $Sprite2D

var speed = 0
var spin = 0

func _ready():
	randomize()
	var x = randi_range(0,4)
	anime.play(str(x))
	var size = randf_range(0.5,1)
	scale.x = size
	scale.y = size
	speed = randf_range(minSpeed, maxSpeed)
	spin = 50


func _physics_process(delta):
	rotation_degrees += spin * delta
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
