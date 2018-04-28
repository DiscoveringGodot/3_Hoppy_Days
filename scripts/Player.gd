extends KinematicBody2D

const SPEED = 700
const GRAVITY = 40
const FRICTION = 0.25
export var jump_height = -1250
var motion = Vector2()
var current_animation = "idle"
var coin_count = 0
var lives = 3

func _physics_process(delta):
	fall()
	run()
	jump()
	check_for_ground()
	move_and_slide(motion,Vector2(0,-1))
	$Animation.animation = current_animation

func fall():
	if is_on_floor() == false:
		motion.y += GRAVITY
	else:
		motion.y = 0

func run():
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		current_animation = "walk"
		$Animation.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		current_animation = "walk"
		$Animation.flip_h = true
	else:
		motion.x = lerp (motion.x, 0, FRICTION)
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
	$Coin_sfx.play()
	print (str(coin_count) + " coins")
	if coin_count > 99:
		lives +=1

func _take_damage():
	motion.y = jump_height
	lives -= 1
	if lives == 0:
		_end_game()

func _end_game():
	pass
	
func _on_SpikesTop_body_shape_entered(body_id, body, body_shape, area_shape):
	if body == self:
		_take_damage()