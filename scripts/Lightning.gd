extends Area2D
const SPEED = -200
var xpos = Vector2()
signal hurt

func _ready():
	xpos = global_position.x
	connect("body_shape_entered", get_node("/root/Level1/Player"), "take_damage")
	
func _physics_process(delta):
	global_position.y -= SPEED * delta
	global_position.x = xpos
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			emit_signal("body_shape_entered",0,body,0,0 )
			queue_free()
		else:
			queue_free()
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()