extends CanvasLayer

@export var shape = 1

func _process(_delta):
	match shape:
		0:
			$AnimationPlayer.play("MoveUp")
		1:
			$AnimationPlayer.play("SpinAround")
		2:
			$AnimationPlayer.play("PolyMove")

	
	
	
	
