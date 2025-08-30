extends Node2D
#컷씬 카메라와 플레이어 카메라 충돌 방지 스크립트

func _ready():
	$Camera2D.make_current()
