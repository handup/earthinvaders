extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	for shotBody in get_colliding_bodies():
		queue_free()
		if (shotBody.has_method("die")):
			shotBody.die()
