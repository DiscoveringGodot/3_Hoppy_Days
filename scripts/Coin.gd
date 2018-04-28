extends Area2D

signal Coin_Pickup

var taken = false
onready var tween = get_node("Tween")

func _process(delta):
	var bodies = get_overlapping_bodies()
	if taken == false: 
		for body in bodies:
			if body.name == "Player":
				$Tween.interpolate_property($AnimatedSprite, "scale", Vector2(1,1), Vector2(0,0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN, 0)
				$Tween.start()
				emit_signal("Coin_Pickup")
				taken = true

	else:
		pass

func _on_Tween_tween_completed(object, key):
	queue_free()