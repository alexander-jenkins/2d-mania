extends Control

var levels = [
	"res://scenes/levels/RotateLevel.tscn",
	"res://scenes/levels/ScaleLevel.tscn",
]

func _ready():
	randomize()



func _on_retry_pressed():
	Score._deaded()
	Signals.emit_signal("startGame")
	var x = randi_range(0,1)
	SceneTransition.change_scene_to_file(levels[x], "dissolve")


func _on_home_pressed():
	Score._deaded()
	Score._endGame()
	SceneTransition.change_scene_to_file("res://scenes/ui/MainPage.tscn", "dissolve")
