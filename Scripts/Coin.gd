extends AnimatedSprite



func _on_Area2D_body_entered(body):
	Global.GameState.coin_up()
	$AnimationPlayer.play("die")
	Global.coin_sfx.play()

func die():
	queue_free()