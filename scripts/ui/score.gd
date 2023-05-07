extends Control

@export var score = 0
var HighScore = 0
@onready var scoreLabel := $CanvasLayer/Label
@onready var music1 := $CanvasLayer/AudioStreamPlayer
@onready var Gameover := $CanvasLayer/AudioStreamPlayer2

func _ready():

	scoreLabel.hide()
	scoreLabel.text = str(score)
	Signals.connect("startGame",Callable(self, "_startGame"))

func _startGame():

	scoreLabel.show()
	music1.play()

func stopMusic():
	if score > HighScore:
		HighScore = score
	music1.stop()
	Gameover.play()

func _endGame():
	scoreLabel.hide()
	music1.stop()

func _scoreIncrease(amonut):
	score += amonut
	print(score)
	scoreLabel.text = str(score)
	

func _deaded():
	score = 0
	print(score)
	scoreLabel.text = str(score)
	
func returnSocre():
	return score
