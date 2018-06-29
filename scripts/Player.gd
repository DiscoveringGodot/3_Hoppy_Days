extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3600
const JUMP_SPEED = -1750
const JUMP_BOOST = 2
const FLOOR_DIRECTION = Vector2(0, -1)
const LEVEL_HEIGHT = 2500
const FRICTION = 0.2

var motion = Vector2()
var gamestate = ""

export(NodePath) var GameStateRef


func _ready():
	gamestate = get_node(str(GameStateRef))

func _physics_process(delta):
	update_motion(delta)
	if get_position().y > LEVEL_HEIGHT:
		_end_game()


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
		$Jump_sfx.play()
		


func update_animation(motion):
	$Animation.update(motion) 


func OnCoinPickup():
	Node.get_node(gamestate).coin_up()
	

func take_damage(body_id, body, body_shape, area_shape):
	motion.y = JUMP_SPEED
	$Pain_sfx.play()
	gamestate.life_down()


func _end_game():
	get_tree().change_scene("res://Levels/EndGame.tscn")


func _on_JumpPad_body_shape_entered(body_id, body, body_shape, area_shape):
	if body == self:
		motion.y = JUMP_SPEED * JUMP_BOOST


func _on_Portal_body_shape_entered(body_id, body, body_shape, area_shape):
	_end_game() #create a victory screen or level 2