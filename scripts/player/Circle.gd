extends Player


@export var spin= 300
var direction = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("Move_left"):
		direction = 1
	elif Input.is_action_pressed("Move_right"):
		direction = -1
	else:
		direction = 0
	rotation_degrees += spin * delta * direction
