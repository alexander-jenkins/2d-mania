extends Control

@export var score = 0
@onready var scoreLabel := $CanvasLayer/Label

func _ready():
	scoreLabel.hide()
	scoreLabel.text = str(score)
	Signals.connect("startGame",Callable(self, "_startGame"))

func _startGame():
	scoreLabel.show()

func _endGame():
	scoreLabel.hide()

func _scoreIncrease(amonut):
	score += amonut
	print(score)
	scoreLabel.text = str(score)

func _deaded():
	score = 0
	print(score)
	scoreLabel.text = str(score)
