extends CharacterBody2D
const rocket = preload("res://scenes/player/rocket.tscn")
@onready var game: Node2D = $".."


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var spawnedRocket = null

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		print("here")
		shoot()

	var direction := Input.get_axis("moveLeft", "moveRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func die():
	# GAME OVER emit to game maner
	queue_free()
	game.currentState = game.State.DEATH

func shoot():
	if spawnedRocket: 
		return
	var rocketNode: RigidBody2D = rocket.instantiate()
	spawnedRocket = rocketNode
	rocketNode.top_level = true
	rocketNode.position = position
	rocketNode.position.y -= 20
	rocketNode.linear_velocity.y = -500
	add_child(rocketNode)
