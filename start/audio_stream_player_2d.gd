extends AudioStreamPlayer2D

var loop_start: float = 6
var loop_end: float = 32.7

func _ready():
	play()

func _process(delta):
	# 현재 재생 위치와 반복 조건을 출력
	if playing and get_playback_position() >= loop_end:
		seek(loop_start)
