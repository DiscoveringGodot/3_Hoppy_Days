extends KinematicBody2D

export var speed = 500
export var gravity = 25
export var jump_height = -700
var motion = Vector2()
var up = Vector2(0,-1)
export var friction = 0.25
onready var animation = $Animation
var current_animation = "idle"

func _ready():
	pass

func _physics_process(delta):
	fall()
	run()
	jump()
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
			current_animation = "jump"
