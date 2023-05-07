extends Area2D

@onready var anime := $AnimatedSprite2D
@export var speedx = 800
@export var direction = -1
@export var UpORDown: bool = false
var object: Player = null

func _ready():
	anime.play("default")

func _physics_process(delta):
	if UpORDown == false:
		if direction == -1:
			rotation_degrees = 0
		else:
			scale.x = -1
		position.x += delta * speedx * direction
	else:
		if direction == -1:
			rotation_degrees = 90
		else:
			rotation_degrees = 270
		position.y += delta * speedx * direction
	if object != null:
		object.death()
	


func _on_VisibilityNotifier2D2_screen_exited():
	queue_free()


func _on_Long_area_entered(area):
	if area is Player:
		object = area

func _on_Long_area_exited(area):
	if area is Player:
		object = null
