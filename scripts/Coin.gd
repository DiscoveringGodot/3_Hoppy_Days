extends Area2D

signal Coin_Pickup

var taken = false # ensure the coin doesn't increment while despawning

func _ready():
	$AnimationPlayer.play("idle")
	connect("body_entered", get_parent().get_parent().get_node("Player"), "OnCoinPickup")
	# TODO remove get_parent() get_parent()

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if not taken:
			taken = true
			$AnimationPlayer.play("die")

func die():  # called by AnimationPlayer node
	queue_free()