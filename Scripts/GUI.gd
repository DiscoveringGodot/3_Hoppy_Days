extends CanvasLayer

func _ready():
	Global.GUI = self  # Singleton pattern

func update_GUI(coins, lives):
	$Banner/HBoxContainer/CoinCount.text = str(coins)
	$Banner/HBoxContainer/LifeCount.text = str(lives)

func animate(animation):
	$AnimationPlayer.play(animation)