extends Area2D

@onready var interaction_icon = $Interaction
var player_in_range = false
var is_searched = false



func _on_body_entered(body):
	if body.name == "너" and not is_searched:
		interaction_icon.show_icon()
		player_in_range = true


func _on_body_exited(body):
	if body.name == "너":
		interaction_icon.hide_icon()
		player_in_range = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("space"):
		if is_searched:
			UIManager.show_notification("더 이상 쓰레기가 보이지 않는다.")
			return
			
		is_searched = true
		interaction_icon.hide_icon()
		UIManager.show_notification("쓰레기통 속에서 아이템을 발견했다!")
