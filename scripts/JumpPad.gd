extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$AnimatedSprite.animation = "launch"
			$Timer.start()

func _on_Timer_timeout():
	$AnimatedSprite.animation = "idle"
