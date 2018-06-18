extends AnimatedSprite

const EPSILON = 0.001

func update(motion):
	if motion.y < -EPSILON && not $RayCast2D.is_colliding():
		play("jump")
	elif motion.x >EPSILON:
		play("walk")
		flip_h = false
	elif motion.x <-EPSILON:
		play("walk")
		flip_h = true
	else:
		play("idle")
