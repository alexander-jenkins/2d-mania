extends Area2D

@onready var animation = $Sprite2D
@export var speed = 5
@export var direction: Vector2 = Vector2(1, 0)
@onready var scene = get_tree().current_scene
var object: Player = null

func _ready():
	animation.play()
	pass

func _process(_delta):
	translate(direction * speed)
	if object != null:
		object.death()


func _on_area_entered(area):
	if area is Player:
		object = area


func _on_area_exited(area):
	if area is Player:
		object = null
