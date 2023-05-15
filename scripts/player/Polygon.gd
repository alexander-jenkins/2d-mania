extends Player

var points = [Vector2(378, 482), Vector2(378, 238), Vector2(902, 238), Vector2(902, 482)]

func _ready():
	pass
	
func _physics_process(_delta):
	if global_position == points[0]: # Player is at bottom left
		if Input.is_action_pressed("Move_right"):
			global_position = points[3] # move to bottom right
			scale.x = -scale.x
		if Input.is_action_pressed("Move_up"):
			global_position = points[1] # move to top left
			scale.y = -scale.y
		pass
	if global_position == points[1]: # Player is at top left
		if Input.is_action_pressed("Move_down"):
			global_position = points[0] # move to bottom left
			scale.y = -scale.y
		if Input.is_action_pressed("Move_right"):
			global_position = points[2] # move to top right
			scale.x = -scale.x
		pass
	if global_position == points[2]: # Player is at top right
		if Input.is_action_pressed("Move_down"):
			global_position = points[3] # move to bottom right
			scale.y = -scale.y
		if Input.is_action_pressed("Move_left"):
			global_position = points[1] # move to top left
			scale.x = -scale.x
		pass
	if global_position == points[3]: # Player is at bottom right
		if Input.is_action_pressed("Move_left"):
			global_position = points[0] # move to bottom left
			scale.x = -scale.x
		if Input.is_action_pressed("Move_up"):
			global_position = points[2] # move to top right
			scale.y = -scale.y
		pass
	
	pass
