extends Area2D

signal Coin_Pickup

var taken = false # may not be needed if we destroy the coin once it's hit
#onready var tween = get_node("Tween") # not being used, delete

func _process(delta):
	if taken == true: # reduces indentation 
		return
		
	var bodies = get_overlapping_bodies()
	for body in bodies: # look for alternative to searching all bodies every frame. Is there a collision message / signal?
		if body.name == "Player":
			tween()
			emit_signal("Coin_Pickup")
			taken = true

func tween():
	$Tween.interpolate_property(
		$AnimatedSprite, "scale", Vector2(1,1), Vector2(0,0),
		0.3, Tween.TRANS_QUAD, Tween.EASE_IN, 0)
	$Tween.start()

func _on_Tween_tween_completed(object, key):
	queue_free() # nice habit