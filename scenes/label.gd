extends Label
@onready var game: Main = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(game.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_score_changed(score: int) -> void:
	text = str(score)
