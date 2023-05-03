extends Control

@export var score = 0
@onready var scoreLabel := $Label

func _ready():
	scoreLabel.text = str(score)



func _scoreIncrease(amonut):
	score += amonut
	print(score)
	scoreLabel.text = str(score)

func _deaded():
	score = 0
	print(score)
	scoreLabel.text = str(score)
