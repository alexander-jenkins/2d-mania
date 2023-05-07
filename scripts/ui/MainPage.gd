extends Control
@onready var music2 := $AudioStreamPlayer3


var levels = [
	"res://scenes/levels/RotateLevel.tscn",
	"res://scenes/levels/ScaleLevel.tscn",
]

func _ready():
	music2.play()
	randomize()




func _on_button_pressed():
	$confirm.play()
	await $confirm.finished
	Signals.emit_signal("startGame")
	var x = randi_range(0,1)
	SceneTransition.change_scene_to_file(levels[x], "dissolve")
