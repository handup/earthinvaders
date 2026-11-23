extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print(body)
	print("Deleting something")
	body.queue_free()
