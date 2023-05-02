extends CanvasLayer


func change_scene(target: String, type: String) -> void:
	match type:
		'dissolve':
			dissolve_scene(target)
		'circle':
			Cricle_scene(target)
		'triangle':
			Triangle_scene(target)
	


func dissolve_scene(target: String):
	$AnimationPlayer.play("Dissolve")
# warning-ignore:return_value_discarded
	get_tree().change_scene(target)
	yield($AnimationPlayer,'animation_finished')
	$AnimationPlayer.play_backwards('Dissolve')


func Cricle_scene(target: String):
	$AnimationPlayer.play("Circle")
# warning-ignore:return_value_discarded
	get_tree().change_scene(target)
	yield($AnimationPlayer,'animation_finished')
	
	$AnimationPlayer.play("CirlceOut")

func Triangle_scene(target: String):
	$AnimationPlayer.play("Triangle")
# warning-ignore:return_value_discarded
	get_tree().change_scene(target)
	yield($AnimationPlayer,'animation_finished')
	
	$AnimationPlayer.play("TrinagleOut")
	
