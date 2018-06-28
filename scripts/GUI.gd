extends Camera2D

var lives = 3  # TODO remove this here or Player
var coins = 00 # TODO remove this here or Player

func _ready():
	update_GUI()

func update_GUI():
	$GUI/Banner/LivesText.text = str(lives)
	$GUI/Banner/CoinText.text = str(coins)

func _on_Player_CoinUp():
	coins += 1
	animate("CoinPulse")
	update_GUI()

func _on_Player_life_down():
	print("Life down called on GUI")  # TODO remove
	lives -= 1
	animate("LifeDown")
	update_GUI()

func _on_Player_LifeUp():
	lives +=1
	animate("LifePulse")
	update_GUI()

func animate(icon):
	$GUI/AnimationPlayer.play(icon)

func _on_Player_LifeDown():
	pass # replace with function body
