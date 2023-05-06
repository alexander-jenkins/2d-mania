extends Node2D

var part := preload("res://scenes/ui/parts.tscn")

@onready var rate := $Timer

func _ready():
	rate.start(1)
	randomize()
	

func _process(_delta):
	if rate.is_stopped():
		var rect = get_viewport_rect()
		var randX := randf_range(rect.position.x, rect.end.x)
		var enemy = part.instantiate()
		enemy.position = Vector2(randX, position.y)
		get_tree().current_scene.add_child(enemy)
		rate.start(1)
