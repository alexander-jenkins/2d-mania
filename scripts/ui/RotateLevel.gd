extends Node2D


@onready var buttons := $Buttons
@onready var clock := $CanvasLayer/Control/Label
@onready var timer := $CanvasLayer/Control/Timer
@onready var title := $CanvasLayer/Control/Label2
@onready var point := $point
@onready var cir := $Circle
@onready var Monster := $Large
@onready var wait := $Timer
var isNextStage: bool = false
var ScaleLVL := preload("res://scenes/levels/ScaleLevel.tscn")

var x: int = 10
var death: bool = false

func _ready():
# warning-ignore:return_value_discarded
	buttons.hide()
	Signals.connect("deaded", Callable(self, "_deaded"))
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
	isNextStage = true
	Monster.hide()
	clock.hide()
	Monster.set_deferred("monitoring", false)
	title.show()
	title.text = str("YOU WIN")
	Score._scoreIncrease(1)
# warning-ignore:return_value_discarded
	SceneTransition.change_scene_to_file("res://scenes/levels/ScaleLevel.tscn", "triangle")


func _deaded():
	death = true
	clock.hide()
	#Monster.hide()
	buttons.show()
	Score.stopMusic()
	Monster.set_deferred("monitoring", false)
	title.show()
	title.text = str("YOU LOSE")




func _on_retry_pressed():
	SceneTransition.change_scene_to_file("res://scenes/levels/ScaleLevel.tscn", "triangle")
	Score._deaded()



