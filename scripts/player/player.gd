extends Area2D
class_name Player
@onready var boom := preload("res://scenes/objects/players/Deathboom.tscn")
@export var is_circle = false

func death():
	Signals.emit_signal("deaded")
	if is_circle == false:
		var effect := boom.instantiate()
		effect.global_position = global_position
		get_parent().add_child(effect)
	queue_free()


