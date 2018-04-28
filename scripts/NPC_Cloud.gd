extends Node2D

var timeout = false

func _ready():
	$Sprite/AnimationPlayer.current_animation = "float"

func _physics_process(delta):
	var body = $Sprite/RayCast2D.get_collider()
	if $Sprite/RayCast2D.is_colliding():
		if body.name == "Player":
			fire()

func fire():
	if timeout == false:
		$Timer.start()
		timeout = true
		print ("PEWPEW!")
	

func _on_Timer_timeout():
	timeout = false