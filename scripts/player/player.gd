extends Area2D

class_name Player

func death():
	Signals.emit_signal("deaded")
	queue_free()


