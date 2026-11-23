extends CharacterBody2D

const SPEED = 150

signal death

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(472, 20)

func _process(delta: float) -> void:
	position.x -= delta * SPEED
	
func die() -> void:
	death.emit()
	queue_free()
