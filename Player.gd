extends KinematicBody2D

export var speed = 250
export var gravity = 50
export var jump_height = 70
var motion = Vector2()
export var friction = 0.25
onready var animation = $Animation

func _ready():
	$Animation.animation = "idle"

func _physics_process(delta):
	movement()

func movement():
	var current_animation
	
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
	animation.animation = current_animation
	move_and_slide(motion)