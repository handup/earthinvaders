class_name Main
extends Node2D
@onready var respawn_timer: Timer = $RespawnTimer
const PLAYER = preload("uid://cbici8sgdb6i2")
@onready var earthlings: Node2D = $Earthlings

const LIVES = 3
enum State { PLAYING, PAUSE, GAME_OVER }
var currentState = State.PLAYING 
var currentLives = LIVES

signal state_changed(state: State)

func _ready() -> void:
	spawnPlayer()


func _process(delta: float) -> void:
	if currentState == State.PAUSE:
		get_tree().paused = true
	else:
		get_tree().paused = false
	
func change_state(new_state: State) -> void:
	if new_state == currentState:
		return
	currentState = new_state
	
	state_changed.emit(currentState)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		change_state(State.PAUSE if currentState == State.PLAYING else State.PLAYING)
		

func _on_player_death() -> void:
	currentLives -= 1
	if currentLives > 0:
		currentState = State.PAUSE
		respawn_timer.start()
	else: 
		currentState = State.GAME_OVER
	

func _on_respawn_timer_timeout() -> void:
	currentState = State.PLAYING
	spawnPlayer()

func spawnPlayer() -> void:
	var player = PLAYER.instantiate()
	player.death.connect(_on_player_death)
	earthlings.player = player
	add_child(player)
