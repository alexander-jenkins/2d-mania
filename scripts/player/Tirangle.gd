extends Player

@export var changeX = 2
@export var changeY = 2

func _ready():
	scale.x = 2
	scale.y = 2

func _physics_process(_delta):
	if Input.is_action_pressed("Move_up") and scale.x > 0.3:
		changeX -= .1
		changeY += .1
	if Input.is_action_pressed("Move_down") and scale.y > 0.3:
		changeY -= .1
		changeX += .1
	scale.y = changeY
	scale.x = changeX
	
	
