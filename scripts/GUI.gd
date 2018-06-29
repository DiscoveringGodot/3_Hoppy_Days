extends Camera2D

func _ready():
	global.GUI = self.get_path()

func update_gui(coins, lives):
	$GUI/Banner/CoinText.text = str(coins)
	$GUI/Banner/LivesText.text = str(lives)

func animate(icon):
	$GUI/AnimationPlayer.play(icon)

