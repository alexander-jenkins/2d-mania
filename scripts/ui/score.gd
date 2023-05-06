extends Control

@export var score = 0
@onready var scoreLabel := $CanvasLayer/Label
@onready var music1 := $CanvasLayer/AudioStreamPlayer
@onready var music2 := $CanvasLayer/AudioStreamPlayer3
@onready var Gameover := $CanvasLayer/AudioStreamPlayer2

func _ready():
	music2.play()
	scoreLabel.hide()
	scoreLabel.text = str(score)
	Signals.connect("startGame",Callable(self, "_startGame"))

func _startGame():
	music2.stop()
	scoreLabel.show()
	music1.play()

func stopMusic():
	music1.stop()
	Gameover.play()

func _endGame():
	music2.play()
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
