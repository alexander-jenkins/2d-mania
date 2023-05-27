extends Control

@onready var music2 := $AudioStreamPlayer3
@onready var howtoPic := $CanvasLayer4
@onready var main := $CanvasLayer2
@onready var credits := $CanvasLayer5
var is_stated: bool = false
var volume = true


var levels = [
	"res://scenes/levels/RotateLevel.tscn",
	"res://scenes/levels/ScaleLevel.tscn",
	"res://scenes/levels/reflection_level.tscn",
	"res://scenes/levels/translate_level.tscn",
]

func _ready():
	Score.tutorialMusicOff()
	if Score.Is_Mute() == true:
		$CanvasLayer2/music.button_pressed = true
		_on_music_toggled(true)
	credits.hide()
	howtoPic.hide()
	music2.play()
	main.show()
	var highScore = Score.Get_HighScore()
	$CanvasLayer2/HighScore.text = str(highScore)
	var type = int(highScore/5)
	if type < 10:
		$CanvasLayer2/Sprite2D.frame = type
	randomize()



func _on_button_pressed():
	$confirm.play()
	is_stated = true
	await $confirm.finished
	Signals.emit_signal("startGame")
	var x = randi_range(0,3)
	SceneTransition.change_scene_to_file(levels[x], "dissolve")


func _on_back_pressed():
	howtoPic.hide()
	main.show()


func _on_button_2_pressed():
	if is_stated == false:
		Score.tutorialMusicOn()
		SceneTransition.change_scene_to_file("res://scenes/levels/Oval_level.tscn", "dissolve")
	


func _on_back_2_pressed():
	main.show()
	credits.hide()


func _on_button_3_pressed():
	if is_stated == false:
		main.hide()
		credits.show()


func _on_music_toggled(button_pressed):
	if button_pressed == true:
		Score.Mute()
		$AudioStreamPlayer3.volume_db = -80
		$confirm.volume_db = -100
	else:
		Score.MusicOn()
		$AudioStreamPlayer3.volume_db = 0
		$confirm.volume_db = 0
		
