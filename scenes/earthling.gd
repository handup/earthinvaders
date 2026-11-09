extends StaticBody2D
const rocket = preload("uid://c6x2ib32w3pmd")

var spawnedRocket = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func die():
	queue_free()

func shoot():
	if spawnedRocket: 
		return
	var rocketNode: RigidBody2D = rocket.instantiate()
	spawnedRocket = rocketNode
	rocketNode.top_level = true
	rocketNode.position = position
	rocketNode.position.y += 20
	rocketNode.linear_velocity.y = -500
	add_child(rocketNode)
