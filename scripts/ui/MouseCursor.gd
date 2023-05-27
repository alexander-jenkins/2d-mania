extends Node

var cursor_mouse = load("res://assets/images/player/Mouse.png")

func _ready():
	Input.set_custom_mouse_cursor(cursor_mouse,Input.CURSOR_ARROW)
	
