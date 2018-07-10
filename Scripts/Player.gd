extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3600
const UP = Vector2(0,-1)
const JUMP_SPEED = -1750

var motion = Vector2()

func _physics_process(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

func _process(delta):
	update_animation(motion)


func update_animation(motion):
	$AnimatedSprite.update(motion)


func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta

func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = 0


func jump():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		motion.y = JUMP_SPEED









