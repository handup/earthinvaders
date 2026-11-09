extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	for shotBody in get_colliding_bodies():
		if shotBody.is_in_group("Earthling"):
			queue_free()
			shotBody.die()
