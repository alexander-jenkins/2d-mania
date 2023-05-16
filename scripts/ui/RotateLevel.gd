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
var level = [
	"res://scenes/levels/translate_level.tscn",
	"res://scenes/levels/ScaleLevel.tscn",
	"res://scenes/levels/reflection_level.tscn"
]

var x: int = 10
var death: bool = false

func _ready():
	randomize()
	cir.spin = 100
# warning-ignore:return_value_discarded
	var score = Score.returnSocre()
	if score > 5:
		Monster.turnRate = 0.5
		cir.spin = 110
	elif score > 10:
		Monster.turnRate = 0.3
	elif score > 18:
		Monster.turnRate = 0.2
		Monster.spin = 130
	elif score > 26:
		Monster.turnRate = 0.1
		Monster.spin = 130
		cir.spin = 140
	elif score > 34:
		Monster.turnRate = 0.05
		Monster.spin = 150
		cir.spin = 160
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
	var z = randi_range(0,2)
	Monster.hide()
	clock.hide()
	Monster.set_deferred("monitoring", false)
	title.show()
	title.text = str("YOU WIN")
	Score._scoreIncrease(1)
# warning-ignore:return_value_discarded
	match z:
		0:
			SceneTransition.change_scene_to_file("res://scenes/levels/translate_level.tscn", "poly")
		1:
			SceneTransition.change_scene_to_file("res://scenes/levels/ScaleLevel.tscn", "triangle")
		2:
			SceneTransition.change_scene_to_file("res://scenes/levels/reflection_level.tscn", "rect")


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



