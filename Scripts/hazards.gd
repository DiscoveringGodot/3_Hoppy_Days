extends Area2D

func _on_body_entered(body):
	Global.GameState.hurt()

