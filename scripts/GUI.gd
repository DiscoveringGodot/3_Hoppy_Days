extends Camera2D

func update_gui(coins, lives):
	$GUI/Banner/CoinText.text = str(coins)
	$GUI/Banner/LivesText.text = str(lives)


func animate(icon):
	$GUI/AnimationPlayer.play(icon)

