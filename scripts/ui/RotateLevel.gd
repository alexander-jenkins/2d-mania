extends Node2D

onready var clock := $Control/Label
onready var timer := $Control/Timer
onready var title := $Control/Label2
onready var cir := $Circle
onready var Monster := $Large
onready var wait := $Timer

var x: int = 10
var death: bool = false

func _ready():
# warning-ignore:return_value_discarded
	Signals.connect("deaded",self,"_deaded")
	title.hide()
	clock.text = str(x)
	timer.start(1)
	

func _process(_delta):
	if timer.is_stopped() and x >= 1:
		x -= 1
		clock.text = str(x)
		timer.start(1)
	if x <= 0 and death == false:
		nextLevel()

func nextLevel():
	Monster.hide()
	clock.hide()
	Monster.set_deferred("monitoring", false)
	title.show()
	title.text = str("YOU WIN")

func _deaded():
	death = true
	clock.hide()
	Monster.hide()
	Monster.set_deferred("monitoring", false)
	title.show()
	title.text = str("YOU LOSE")
