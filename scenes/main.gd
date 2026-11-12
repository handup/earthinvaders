extends Node2D

const LIVES = 3
enum State { PLAYING, PAUSE, DEATH}
var currentState = State.PLAYING 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
