extends Area2D
const SPEED = -200

func _ready():
	print("here I am!")

func _physics_process(delta):
	position.y -= SPEED * delta