extends Area2D
const SPEED = -200
var xpos = Vector2()
signal hurt

func _ready():
	xpos = global_position.x
	

func _physics_process(delta):
	global_position.y -= SPEED * delta
	global_position.x = xpos
	manage_collision()
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()


func manage_collision():
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":  # Remove magic string
			get_node(global.Player).take_damage()
		queue_free()