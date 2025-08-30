extends CharacterBody2D

@export var 이동속도 = 200
@onready var 스프라이트 = $AnimatedSprite2D

func _physics_process(delta):
	if Input.is_action_pressed("위") == true:
		velocity.y = -이동속도
	if Input.is_action_pressed("아래") == true:
		velocity.y = 이동속도
	if Input.is_action_pressed("오른쪽") == true:
		velocity.x = 이동속도
	if Input.is_action_pressed("왼쪽") == true:
		velocity.x = -이동속도
	if Input.is_action_pressed("위") == false && Input.is_action_pressed("아래") == false || Input.is_action_pressed("위") && Input.is_action_pressed("아래"):
		velocity.y = 0
	if Input.is_action_pressed("왼쪽") == false && Input.is_action_pressed("오른쪽") == false || Input.is_action_pressed("왼쪽") && Input.is_action_pressed("오른쪽"):
		velocity.x = 0
	if velocity.y < 0 && velocity.x == 0:
		스프라이트.play("위")
	if velocity.y > 0 && velocity.x == 0:
		스프라이트.play("아래")
	if velocity.x < 0:
		스프라이트.play("왼쪽")
	if velocity.x > 0:
		스프라이트.play("오른쪽")
	if velocity.x == 0 && velocity.y ==0:
		스프라이트.stop()
		
	move_and_slide()
