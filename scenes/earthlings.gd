extends Node2D
@onready var movement: Timer = $Movement

const MOVEMENT_DISTANCE = 20
var direction = MOVEMENT_DISTANCE
var movementCounter = 1
var spawnedBullets = 0

func _process(delta: float) -> void:
	var earthling_groups = get_children()
	for earthling_group in earthling_groups:
		for earthling in earthling_group.get_children():
			pass
			# make them shoot enemyRockets at random
		

func _on_movement_timeout():
	if movementCounter % 10 == 0:
		direction *= -1
		position.y += MOVEMENT_DISTANCE
	else:
		position.x += direction
	movementCounter += 1
	print(position)
	print("timeout")
