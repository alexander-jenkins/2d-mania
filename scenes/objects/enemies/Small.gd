extends Area2D

@onready var animation = $Sprite2D
@export var speed = 0.001
@export var direction: Vector2 = Vector2(1, 0)

func _ready():
	animation.play()
	pass

func _process(_delta):
	translate(direction * speed)
	pass
