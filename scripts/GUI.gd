extends Camera2D

onready var livestext = $GUI/Banner/LivesText
onready var cointext = $GUI/Banner/CoinText


var lives = 3
var coins = 00

func _ready():
	update_GUI()

func update_GUI():
	livestext.text = str(lives)
	cointext.text = str(coins)

func _on_Player_coin_up():
	var tween = $GUI/Banner/CoinLogo/CoinTween
	coins +=1
	tween.interpolate_property($GUI/Banner/CoinLogo, "rect_scale", 
			Vector2(1.25,1.25), Vector2(1,1), .2, Tween.TRANS_BOUNCE, 
			Tween.EASE_IN_OUT, 0)
	tween.start()

	update_GUI()

func _on_Player_life_down():
	lives -=1
	_life_tween()
	update_GUI()

func _on_Player_life_up():
	lives +=1
	_life_tween()
	update_GUI()

func _life_tween():
	var tween = $GUI/Banner/BunnyLogo/LifeTween
	tween.interpolate_property($GUI/Banner/BunnyLogo, "rect_scale", 
			Vector2(1.25,1.25), Vector2(1,1), .2, Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT, 0)
	tween.start()