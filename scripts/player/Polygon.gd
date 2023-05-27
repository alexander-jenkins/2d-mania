extends Player

@export var speed = 10
var velocity = Vector2.ZERO
@onready var view = get_viewport()


func _ready():
	$Sprite2D.play("normal")
	
func _physics_process(_delta):
	var direction = Input.get_vector("Move_left", "Move_right", "Move_up", "Move_down")
	velocity = direction * speed
	position.x = clamp(position.x, 0, view.size.x)
	position.y = clamp(position.y, 0, view.size.y)
	translate(velocity)
	
