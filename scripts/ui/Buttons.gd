extends Control

var levels = [
	"res://scenes/levels/RotateLevel.tscn",
	"res://scenes/levels/ScaleLevel.tscn",
	"res://scenes/levels/reflection_level.tscn",
	"res://scenes/levels/translate_level.tscn"
]

func _ready():
	randomize()



func _on_retry_pressed():
	Score._deaded()
	Signals.emit_signal("startGame")
	get_tree().call_group("Emeny", "queue_free")
	var x = randi_range(0,3)
	SceneTransition.change_scene_to_file(levels[x], "dissolve")


func _on_home_pressed():
	Score._deaded()
	Score._endGame()
	get_tree().call_group("Emeny", "queue_free")
	SceneTransition.change_scene_to_file("res://scenes/ui/MainPage.tscn", "dissolve")
