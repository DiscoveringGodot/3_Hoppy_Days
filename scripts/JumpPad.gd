extends Area2D

func _on_JumpPad_body_shape_entered(body_id, body, body_shape, area_shape):
	$AnimatedSprite.animation = "launch"
	$Timer.start()

func _on_Timer_timeout():
	$AnimatedSprite.animation = "idle"

