extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3600
const JUMP_SPEED = -1750
const JUMP_BOOST = 2
const FLOOR_DIRECTION = Vector2(0, -1)
const LEVEL_HEIGHT = 2500
const FRICTION = 0.2

var motion = Vector2()
 
func _ready():
	global.Player = self.get_path()

func _physics_process(delta):
	update_motion(delta)
	if get_position().y > LEVEL_HEIGHT:
		get_node(global.GameState).game_over()


func _process(delta):
	update_animation(motion)


func update_motion(delta):
	fall(delta)  # frame-rate independant
	run()
	jump()
	move_and_slide(motion, FLOOR_DIRECTION)


func fall(delta):
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta


func run():
	if Input.is_action_pressed("ui_right") && not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") && not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = lerp(motion.x, 0, FRICTION)


func jump():
	if is_on_floor() && Input.is_action_pressed("ui_up"):
		motion.y = JUMP_SPEED
		get_node(global.GUI).play_sound(global.jump_sfx)
		

func update_animation(motion):
	$Animation.update(motion) 


func take_damage():
	get_node(global.GameState).life_down()
	motion.y = JUMP_SPEED


func _on_JumpPad_body_shape_entered(body_id, body, body_shape, area_shape):
	motion.y = JUMP_SPEED * JUMP_BOOST


func _on_Portal_body_shape_entered(body_id, body, body_shape, area_shape):
	get_node(global.GameState).game_over()