extends Control
@onready var music2 := $AudioStreamPlayer3
@onready var howtoPic := $CanvasLayer4
@onready var main := $CanvasLayer2
@onready var credits := $CanvasLayer5
var is_stated: bool = false


var levels = [
	"res://scenes/levels/RotateLevel.tscn",
	"res://scenes/levels/ScaleLevel.tscn",
]

func _ready():
	credits.hide()
	howtoPic.hide()
	music2.play()
	main.show()
	randomize()




func _on_button_pressed():
	$confirm.play()
	is_stated = true
	await $confirm.finished
	Signals.emit_signal("startGame")
	var x = randi_range(0,1)
	SceneTransition.change_scene_to_file(levels[x], "dissolve")


func _on_back_pressed():
	howtoPic.hide()
	main.show()


func _on_button_2_pressed():
	if is_stated == false:
		howtoPic.show()
		main.hide()
	


func _on_back_2_pressed():
	main.show()
	credits.hide()


func _on_button_3_pressed():
	if is_stated == false:
		main.hide()
		credits.show()
