extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var interaction_label = $"../InteractionUI/Label"
@onready var dialogue_ui = $"../DialogueUI/Panel"
@onready var portrait = $"../DialogueUI/Panel/TextureRect"
@onready var dialogue_text = $"../DialogueUI/Panel/Label"

# 플레이어가 범위 안에 있는지 여부
var player_in_range = false
# 현재 대화가 활성화되었는지 여부
var is_dialogue_active = false

# 1. NPC의 대사를 배열로 미리 준비합니다.
var dialogue_lines = [
	"...",
	"...다시 만났네.",
	"이 곡은 내가 가장 아끼는 곡이야.",
	"...",
	"너에게도 이 멜로디가 닿았으면 좋겠다."
]
# 2. 현재 대사의 순서를 추적할 변수 (index)
var dialogue_index = 0


func _ready():
	sprite.play("look_piano")
	interaction_label.visible = false
	dialogue_ui.visible = false


func _process(delta):
	# 플레이어가 범위 안에 있고, 스페이스바를 눌렀을 때
	if player_in_range and Input.is_action_just_pressed("space"):
		# 3. 대화가 활성화 되어있지 않다면 -> 대화 시작
		if not is_dialogue_active:
			start_dialogue()
		# 4. 대화가 이미 활성화 되어있다면 -> 다음 대사로 넘기기
		else:
			advance_dialogue()

# 대화 시작 함수
func start_dialogue():
	is_dialogue_active = true
	dialogue_index = 0
	
	# 대화가 시작되면 상호작용 UI는 숨깁니다.
	interaction_label.visible = false
	
	# 대화창 UI를 보여줍니다.
	dialogue_ui.visible = true
	portrait.visible = true
	
	# 첫 번째 대사를 표시합니다.
	dialogue_text.text = dialogue_lines[dialogue_index]
	
	# 상호작용 애니메이션/사운드 재생
	$"../피아노소녀 상호작용".play("상호작용")


# 다음 대사로 넘어가는 함수
func advance_dialogue():
	# 대사 인덱스를 1 증가시킵니다.
	dialogue_index += 1
	
	# 아직 보여줄 대사가 남아있다면
	if dialogue_index < dialogue_lines.size():
		# 다음 대사를 Label에 표시합니다.
		dialogue_text.text = dialogue_lines[dialogue_index]
	# 모든 대사가 끝났다면
	else:
		# 대화를 종료합니다.
		end_dialogue()
		get_tree().change_scene_to_file("res://챕터1/챕터1_본게임.tscn")

# 대화 종료 함수
func end_dialogue():
	is_dialogue_active = false
	dialogue_ui.visible = false
	
	# 플레이어가 여전히 범위 안에 있다면, 다시 상호작용 UI를 보여줍니다.
	if player_in_range:
		interaction_label.visible = true

func _on_body_entered(body):
	if body.name == "너":
		player_in_range = true
		interaction_label.visible = true

func _on_body_exited(body):
	if body.name == "너":
		player_in_range = false
		interaction_label.visible = false
		# 만약 플레이어가 대화 도중에 범위를 벗어나면 대화를 강제로 종료합니다.
		if is_dialogue_active:
			end_dialogue()
