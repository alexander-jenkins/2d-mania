extends Control

@onready var start := $Button
@onready var how2 := $Button2
@onready var credit := $Button3

var levels = [
	"res://scenes/levels/RotateLevel.tscn",
	"res://scenes/levels/ScaleLevel.tscn"
]

func _ready():
	randomize()




func _on_button_pressed():
	var x = randi_range(0,1)
	SceneTransition.change_scene_to_file(levels[x], "dissolve")
