extends Node2D
@onready var movement: Timer = $Movement
@onready var player: CharacterBody2D = $"../Player"
@onready var game: Node2D = $".."

const MOVEMENT_DISTANCE = 20
var direction = MOVEMENT_DISTANCE
var movementCounter = 1

func _process(delta: float) -> void:
	if(game.currentState == game.State.PLAYING):
		var earthling_groups = get_children()
		for earthling_group in earthling_groups:
			for earthling in earthling_group.get_children():
				if canShoot() and (abs(player.position.x - earthling.position.x)< 200):
					earthling.shoot()
	else:
		movement.paused = true
		

func canShoot():
	return (randi() % 20 == 2) and get_tree().get_nodes_in_group("enemy_rocket").size() < 3
	

func _on_movement_timeout():
	if movementCounter % 10 == 0:
		direction *= -1
		position.y += MOVEMENT_DISTANCE
	else:
		position.x += direction
	movementCounter += 1
	print(position)
	print("timeout")
