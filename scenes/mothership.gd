extends StaticBody2D

const SPEED = 150

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(472, 20)

func _process(delta: float) -> void:
	position.x -= delta * SPEED
