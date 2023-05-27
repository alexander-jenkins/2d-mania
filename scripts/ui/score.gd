extends Control

@export var score = 0
var scoreMuilpte = 0
var HighScore = 0
var x = 0
@onready var scoreHUB := $CanvasLayer/Control
@onready var scoreLabel := $CanvasLayer/Control/Label
@onready var music1 := $CanvasLayer/AudioStreamPlayer
@onready var Gameover := $CanvasLayer/AudioStreamPlayer2
@onready var Tutorial := $CanvasLayer/AudioStreamPlayer3
var volume: bool = false

func _ready():

	scoreHUB.hide()
	scoreLabel.text = str(score)
	Signals.connect("startGame",Callable(self, "_startGame"))

func _startGame():
	$CanvasLayer/Control/Sprite2D.frame = 0
	x = 0
	scoreHUB.show()
	music1.play()

func tutorialMusicOn():
	Tutorial.play()

func tutorialMusicOff():
	Tutorial.stop()

func _process(_delta):
	if scoreMuilpte >= 5:
		if x <= 9:
			x += 1
			$CanvasLayer/Control/Sprite2D.frame = x
			scoreMuilpte = 0
	else:
		pass
	

func stopMusic():
	if score > HighScore:
		HighScore = score
	Gameover.play()
	music1.stop()

func Get_HighScore():
	return HighScore

func _endGame():
	scoreHUB.hide()
	music1.stop()

func _scoreIncrease(amonut):
	score += amonut
	scoreMuilpte += amonut
	print(score)
	scoreLabel.text = str(score)
	

func _deaded():
	scoreMuilpte = 0
	score = 0
	print(score)
	scoreLabel.text = str(score)
	
func returnSocre():
	return score

func Mute():
	$CanvasLayer/AudioStreamPlayer.volume_db = -80
	$CanvasLayer/AudioStreamPlayer2.volume_db = -80
	$CanvasLayer/AudioStreamPlayer3.volume_db = -80
	volume = true

func MusicOn():
	$CanvasLayer/AudioStreamPlayer.volume_db = 0
	$CanvasLayer/AudioStreamPlayer2.volume_db = 0
	$CanvasLayer/AudioStreamPlayer3.volume_db = 0
	volume = false

func Is_Mute():
	return volume
