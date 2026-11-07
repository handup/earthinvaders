extends CharacterBody2D
const rocket = preload("res://scenes/player/rocket.tscn")


const SPEED = 500.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		print("here")
		var rocketNode: RigidBody2D = rocket.instantiate()
		rocketNode.position.x = 20
		rocketNode.linear_velocity.y = -500
		add_child(rocketNode)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
