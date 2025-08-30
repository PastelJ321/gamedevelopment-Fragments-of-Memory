extends Area2D

func _on_body_entered(body):
	if body.name == "너":
		if body.has_method("die"):
			body.die()
