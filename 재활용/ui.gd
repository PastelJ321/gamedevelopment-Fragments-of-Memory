extends CanvasLayer

@onready var notification_panel = $NotificationPanel
@onready var notification_label = $NotificationPanel/NotificationLabel
@onready var notification_timer = $NotificationTimer

func _ready():
	# 타이머가 끝나면 패널을 숨기는 함수와 연결
	notification_timer.timeout.connect(_on_notification_timer_timeout)

# 이 함수를 호출하면 게임 화면에 메시지가 나타남!
func show_notification(message: String, duration: float = 2.0):
	print("--- 알림 메시지 디버깅 ---")
	print("전달된 메시지: ", message)
	
	if notification_label == null:
		print("에러: notification_label을 찾을 수 없습니다! 경로를 확인하세요.")
		return
	print("notification_label 노드: ", notification_label.name)
	print("기존 텍스트: ", notification_label.text)
	notification_label.text = message
	notification_panel.visible = true
	notification_timer.start(duration)
	print("새로운 텍스트: ", notification_label.text)
	print("------------------------")
	
# 타이머가 끝나면 호출될 함수
func _on_notification_timer_timeout():
	notification_panel.visible = false
	
