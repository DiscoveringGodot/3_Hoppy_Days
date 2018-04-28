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
	coins +=1
	update_GUI()


func _on_Player_life_down():
	lives -=1
	update_GUI()

func _on_Player_life_up():
	lives +=1
	update_GUI()
