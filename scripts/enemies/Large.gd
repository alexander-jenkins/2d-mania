extends Area2D
var spin = 100
@export var turn = 1
@export var Min = 1
@export var Max = 2
@onready var rate := $turnrate

func _ready():
	randomize()

func _process(delta):
	if rate.is_stopped():
		turn *= -1
		rate.start(randf_range(Min,Max))
	rotation_degrees += spin * turn * delta 
