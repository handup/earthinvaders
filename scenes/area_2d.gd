extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("Deleting bullet")
	body.queue_free()
