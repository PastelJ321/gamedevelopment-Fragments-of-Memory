extends Control

@export var dialogue: Array[String] = [
	"안녕, 나는 피아노 소녀야.",
	"이 피아노는 내가 가장 좋아하는 악기야.",
	"연주를 들려줄까? 챕터1로 들어가자!"
]
@export var npc_image: Texture2D

var current_index: int = 0
var active: bool = false

func show_dialogue():
	current_index = 0
	$TextureRect.texture = npc_image
	$Label.text = dialogue[current_index]
	self.visible = true
	active = true
	# 플레이어 이동 잠금 신호 보내기
	get_tree().call_group("player", "set_move_locked", true)

func _process(delta):
	if active and (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_select")):
		next_dialogue()

func next_dialogue():
	current_index += 1
	if current_index < dialogue.size():
		$Label.text = dialogue[current_index]
	else:
		# 대화 끝!
		self.visible = false
		active = false
		# 플레이어 이동 잠금 해제
		get_tree().call_group("player", "set_move_locked", false)
		# 챕터1로 이동
		get_tree().change_scene_to_file("res://챕터1/챕터1_본게임.tscn")
