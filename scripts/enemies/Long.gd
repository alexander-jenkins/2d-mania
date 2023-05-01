extends Area2D

export var speedx = 800
export var direction = -1
export var UpORDown: bool = false
var object: Player = null

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if UpORDown == false:
		if direction == -1:
			rotation_degrees = 0
		else:
			scale.x = -1
		position.x += delta * speedx * direction
	else:
		speedx = 700
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
