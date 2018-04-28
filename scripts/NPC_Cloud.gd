extends Node2D

var timeout = false
var lightning = preload("res://NPCs/Lightning.tscn")

func _ready():
	$Sprite/AnimationPlayer.current_animation = "float"

func _physics_process(delta):
	var body = $Sprite/RayCast2D.get_collider()
	if $Sprite/RayCast2D.is_colliding():
		if body.name == "Player":
			fire()

func fire():
	if timeout == false:
		print("where is it?")
		var mypos = self.position
		get_parent().add_child(lightning.instance(), true)
		lightning.set_position(position)
		$Timer.start()
		timeout = true
	

func _on_Timer_timeout():
	timeout = false