extends AnimatedSprite

func update(motion):
	if motion.y < 0:
		play("jump")
	elif motion.x > 0:
		play("run")
	elif motion.x < 0:
		play("run")
	else:
		play("idle")