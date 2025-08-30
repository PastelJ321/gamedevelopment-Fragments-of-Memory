extends Node2D

@onready var animation_player = $AnimationPlayer

func show_icon():
	animation_player.play("appear")

func hide_icon():
	animation_player.play("disappear")
