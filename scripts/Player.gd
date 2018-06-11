extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3600
const JUMP_SPEED = -1750
const JUMP_BOOST = 2
const FLOOR_DIRECTION = Vector2(0,-1)
const LEVEL_HEIGHT = 2500

var motion = Vector2()
var current_animation = "idle"
var coin_count = 0
var coin_target = 20 #how many coins for an extra life?
var lives = 3

signal life_up
signal life_down
signal coin_up

func _physics_process(delta):
	fall(delta)
	run()
	jump()
	check_for_ground()
	move_and_slide(motion, FLOOR_DIRECTION)
	if get_position().y > LEVEL_HEIGHT:
		_end_game()
		
func _process(delta):
		$Animation.animation = current_animation  # here or in process

func fall(delta):
	if is_on_floor() == false:
		motion.y += GRAVITY * delta  # frame-rate independant
	else:
		motion.y = 0

func run():
	var input = float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left"))
	current_animation = "walk"
	if input >0:
		$Animation.flip_h = false
		motion.x = SPEED*input
	elif input <0:
		$Animation.flip_h = true
		motion.x = SPEED*input
	else:
		current_animation = "idle"
		motion.x = lerp(motion.x,0,0.2)

func jump():
	if is_on_floor() == true:
			if Input.is_action_pressed("ui_up"):
				motion.y = JUMP_SPEED
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
		motion.y = JUMP_SPEED
		emit_signal("life_down")
		$Pain_sfx.play()
		lives -= 1
		
	if lives < 0:
			_end_game()

func _end_game():
	get_tree().change_scene("res://EndGame.tscn")

func _on_JumpPad_body_shape_entered(body_id, body, body_shape, area_shape):
	if body == self:
		motion.y = JUMP_SPEED * JUMP_BOOST

func _on_Portal_body_shape_entered(body_id, body, body_shape, area_shape):
	_end_game() #create a victory screen or level 2
