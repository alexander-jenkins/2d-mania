extends CanvasLayer


func change_scene_to_file(target: String, type: String) -> void:
	match type:
		'dissolve':
			dissolve_scene(target)
		'circle':
			Cricle_scene(target)
		'triangle':
			Triangle_scene(target)
		'poly':
			Poly_scene(target)
		'rect':
			Rect_scene(target)
	


func dissolve_scene(target: String):
	$AnimationPlayer.play("Dissolve")
# warning-ignore:return_value_discarded
	get_tree().change_scene_to_file(target)
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play_backwards('Dissolve')


func Cricle_scene(target: String):
	$AnimationPlayer.play("Circle")
# warning-ignore:return_value_discarded
	get_tree().change_scene_to_file(target)
	await $AnimationPlayer.animation_finished
	
	$AnimationPlayer.play("CirlceOut")

func Triangle_scene(target: String):
	$AnimationPlayer.play("Triangle")
# warning-ignore:return_value_discarded
	get_tree().change_scene_to_file(target)
	await $AnimationPlayer.animation_finished
	
	$AnimationPlayer.play("TrinagleOut")
	
func Poly_scene(target: String):
	$AnimationPlayer.play("Poly")
# warning-ignore:return_value_discarded
	get_tree().change_scene_to_file(target)
	await $AnimationPlayer.animation_finished
	
	$AnimationPlayer.play("PolyOut")
	
func Rect_scene(target: String):
	$AnimationPlayer.play("Rectangle")
# warning-ignore:return_value_discarded
	get_tree().change_scene_to_file(target)
	await $AnimationPlayer.animation_finished
	
	$AnimationPlayer.play("RectangleOut")
