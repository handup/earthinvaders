class_name Main
extends Node2D
@onready var respawn_timer: Timer = $RespawnTimer
const PLAYER = preload("uid://cbici8sgdb6i2")
@onready var earthlings: Node2D = $Earthlings
const HELICOPTER = preload("uid://bmmksnkx8kfhc")

const LIVES = 3
var score = 0
enum State { PLAYING, PAUSE, GAME_OVER, GAME_WON }
var currentState = State.PLAYING 
var currentLives = LIVES
var remaining_earthlings = 0

signal state_changed(state: State)
signal score_changed(score: int)
signal game_won

func _ready() -> void:
	spawnHelicopter()
	spawnPlayer()
	for earthling_group in get_children():
		for earthling in earthling_group.get_children():
			remaining_earthlings += 1


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
		
func _on_enemy_death(score_gained: int) -> void:
	increase_score(score_gained)
	remaining_earthlings -= 1
	if remaining_earthlings == 0:
		win_game()
		
func _on_helicopter_death() -> void:
	increase_score(300)
		
func win_game() -> void:
	change_state(State.GAME_WON)

func _on_player_death() -> void:
	currentLives -= 1
	if currentLives > 0:
		currentState = State.PAUSE
		respawn_timer.start()
	else: 
		currentState = State.GAME_OVER
		
func increase_score(gainedAmount: int) -> void: 
	score += gainedAmount
	score_changed.emit(score)
	
func _on_respawn_timer_timeout() -> void:
	currentState = State.PLAYING
	spawnPlayer()

func spawnPlayer() -> void:
	var player = PLAYER.instantiate()
	player.death.connect(_on_player_death)
	earthlings.player = player
	add_child(player)
	
func spawnHelicopter() -> void:
	var helicopter = HELICOPTER.instantiate()
	helicopter.death.connect(_on_helicopter_death)
	add_child(helicopter)
