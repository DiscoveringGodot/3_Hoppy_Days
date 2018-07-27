extends Area2D

const SPEED = 200
var xpos = Vector2()

func _ready():
	xpos = global_position.x

func _physics_process(delta):
	move_down_screen(delta)
	manage_collision()
	
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()


func move_down_screen(delta):
	global_position.y += SPEED * delta
	global_position.x = xpos


func manage_collision():
	var collider = get_overlapping_bodies()
	for object in collider:
		if object == Global.Player:
			Global.GameState.hurt()
		queue_free()