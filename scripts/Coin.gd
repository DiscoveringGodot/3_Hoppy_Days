extends Area2D

signal Coin_Pickup

var taken = false # ensure the coin doesn't increment while despawning

func _ready():
	$AnimationPlayer.play("idle")
	# connect("Coin_Pickup", get_node(global.GameState), "coin_up")
	# TODO remove get_parent() get_parent()

func _on_Coin_body_entered(body):
	var bodies = get_overlapping_bodies()
	if body in bodies && not taken:
		taken = true
		get_node(global.GameState).coin_up()
		$AnimationPlayer.play("die")
	#	emit_signal("Coin_Pickup")
		

func die():  # called by AnimationPlayer node
	queue_free()
