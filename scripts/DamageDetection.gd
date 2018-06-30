extends Area2D

# consdier alongside collision masking
func body_entered(body):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		get_node(global.Player).take_damage()

