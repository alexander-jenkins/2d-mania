extends Player

var points = [Vector2(378, 482), Vector2(378, 238), Vector2(902, 238), Vector2(902, 482)]
var pon = 0.5

func _ready():
	pass
	
func _physics_process(_delta):
	if global_position == points[0]: # Player is at bottom left
		if Input.is_action_pressed("Move_right"):
			$CollisionShape2D.disabled = true
			$Sprite2D.play("Teleport")
			await $Sprite2D.animation_finished
			$CollisionShape2D.disabled = false
			global_position = points[3] # move to bottom right
			$Sprite2D.play_backwards("Teleport")
		if Input.is_action_pressed("Move_up"):
			$CollisionShape2D.disabled = true
			$Sprite2D.play("Teleport")
			await $Sprite2D.animation_finished
			$CollisionShape2D.disabled = false
			global_position = points[1] # move to top left
			$Sprite2D.play_backwards("Teleport")
			
	if global_position == points[1]: # Player is at top left
		if Input.is_action_pressed("Move_down"):
			$CollisionShape2D.disabled = true
			$Sprite2D.play("Teleport")
			await $Sprite2D.animation_finished
			$CollisionShape2D.disabled = false
			global_position = points[0] # move to bottom left
			$Sprite2D.play_backwards("Teleport")
		if Input.is_action_pressed("Move_right"):
			$CollisionShape2D.disabled = true
			$Sprite2D.play("Teleport")
			await $Sprite2D.animation_finished
			$CollisionShape2D.disabled = false
			global_position = points[2] # move to top right
			$Sprite2D.play_backwards("Teleport")
		
	if global_position == points[2]: # Player is at top right
		if Input.is_action_pressed("Move_down"):
			$CollisionShape2D.disabled = true
			$Sprite2D.play("Teleport")
			await $Sprite2D.animation_finished
			$CollisionShape2D.disabled = false
			global_position = points[3] # move to bottom right
			$Sprite2D.play_backwards("Teleport")
		if Input.is_action_pressed("Move_left"):
			$CollisionShape2D.disabled = true
			$Sprite2D.play("Teleport")
			await $Sprite2D.animation_finished
			$CollisionShape2D.disabled = false
			global_position = points[1] # move to top left
			$Sprite2D.play_backwards("Teleport")
		
	if global_position == points[3]: # Player is at bottom right
		if Input.is_action_pressed("Move_left"):
			$CollisionShape2D.disabled = true
			$Sprite2D.play("Teleport")
			await $Sprite2D.animation_finished
			$CollisionShape2D.disabled = false
			global_position = points[0] # move to bottom left
			$Sprite2D.play_backwards("Teleport")
		if Input.is_action_pressed("Move_up"):
			$CollisionShape2D.disabled = true
			$Sprite2D.play("Teleport")
			await $Sprite2D.animation_finished
			$CollisionShape2D.disabled = false
			global_position = points[2] # move to top right
			$Sprite2D.play_backwards("Teleport")
		

func _process(_delta):
	if global_position == points[0]:
		scale.x = -pon
		scale.y = pon
	elif global_position == points[1]:
		scale.x = -pon
		scale.y = -pon
	elif global_position == points[2]:
		scale.x = pon
		scale.y = -pon
	elif global_position == points[3]:
		scale.x = pon
		scale.y = pon

func teleport():
	$Sprite2D.play("Teleport")
	await $Sprite2D.animation_finished
