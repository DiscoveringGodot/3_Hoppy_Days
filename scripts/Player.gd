extends KinematicBody2D

# nice job grouping. Worth creating a coding standard for order at the top.
const SPEED = 700
const GRAVITY = 40
const FRICTION = 0.25
const JUMP_HEIGHT = -1750
const JUMP_BOOST = 2

var motion = Vector2()
var current_animation = "idle"
var coin_count = 0
var coin_target = 20 #how many coins for an extra life?
var lives = 3

signal life_up
signal life_down
signal coin_up

func _physics_process(delta):
	fall()
	run()
	jump()
	check_for_ground()
	move_and_slide(motion,Vector2(0,-1))
	$Animation.animation = current_animation
	if get_position().y  > 2500: # take out magic number
		_end_game()

func fall():
	if is_on_floor() == false || $HeadRay.is_colliding():
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
		if Input.is_action_pressed("ui_up"): # suggest binding spacebar as well as up-arrow to jump
			motion.y = JUMP_HEIGHT
			$Jump_sfx.play()

func check_for_ground():
	if not $CollisionRay.is_colliding():
		current_animation = "jump"

func _on_Coin_Coin_Pickup():
	coin_count += 1
	$Coin_sfx.play()
	emit_signal("coin_up")
	if coin_count >= coin_target:
		lives +=1
		coin_count = 0
		emit_signal("life_up")

func take_damage(body_id, body, body_shape, area_shape):
	if body == self:
		motion.y = JUMP_HEIGHT
		emit_signal("life_down")
		$Pain_sfx.play()
		lives -= 1
		
	if lives < 0:
			_end_game()

func _end_game():
	get_tree().change_scene("res://EndGame.tscn")

func _on_JumpPad_body_shape_entered(body_id, body, body_shape, area_shape):
	if body == self:
		motion.y = JUMP_HEIGHT * JUMP_BOOST

func _on_Portal_body_shape_entered(body_id, body, body_shape, area_shape):
	_end_game() #create a victory screen or level 2
