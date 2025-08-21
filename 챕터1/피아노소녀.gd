extends CharacterBody2D

signal start_dialogue

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("start_dialogue")
