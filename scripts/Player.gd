extends KinematicBody2D

export var speed = 500
export var gravity = 40
export var jump_height = -1250
var motion = Vector2()
var up = Vector2(0,-1)
export var friction = 0.25
onready var animation = $Animation
var current_animation = "idle"
var coin_count = 0

func _physics_process(delta):
	fall()
	run()
	jump()
	check_for_ground()
	move_and_slide(motion,up)
	animation.animation = current_animation

func fall():
	if is_on_floor() == false:
		motion.y += gravity
	else:
		motion.y = 0

func run():
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		current_animation = "walk"
		animation.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		current_animation = "walk"
		animation.flip_h = true
	else:
		motion.x = lerp (motion.x, 0, friction)
		current_animation = "idle"

func jump():
	if is_on_floor() == true:
		if Input.is_action_pressed("ui_up"):
			motion.y = jump_height

func check_for_ground():
	if not $CollisionRay.is_colliding():
		current_animation = "jump"

func _on_Coin_Coin_Pickup():
	coin_count += 1
	print (str(coin_count) + " coins")
