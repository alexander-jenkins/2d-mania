extends Control



var levels = [
	"res://scenes/levels/RotateLevel.tscn",
	"res://scenes/levels/ScaleLevel.tscn",
]

func _ready():
	randomize()




func _on_button_pressed():
	Signals.emit_signal("startGame")
	var x = randi_range(0,1)
	SceneTransition.change_scene_to_file(levels[x], "dissolve")
