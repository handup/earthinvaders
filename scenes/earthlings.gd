extends Node2D
@onready var movement: Timer = $Movement
@onready var player: CharacterBody2D = $"../Player"
@onready var game: Node2D = $".."

const MOVEMENT_DISTANCE = 20
var direction = MOVEMENT_DISTANCE
var movementCounter = 1


func _process(delta: float) -> void:
	match game.currentState:
		Main.State.PLAYING:
			movement.paused = false
			shootIfPlayerClose()
		Main.State.PAUSE, Main.State.GAME_OVER:
			movement.paused = true
			pass
		
func shootIfPlayerClose():
	if !player: return
	for earthling_group in get_children():
		for earthling in earthling_group.get_children():
			if canShoot() and (abs(player.position.x - earthling.position.x) < 200):
				earthling.shoot()


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
