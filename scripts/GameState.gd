extends Node2D

var coins = 0
var lives = 0

export var coin_target = 20  # How many coins for an extra life?
export var starting_lives = 3

onready var gui = get_node(global.GUI)

func _ready():
	global.GameState = self.get_path()
	lives = starting_lives
	update_gui()
	

func coin_up():
	coins += 1
	#$Coin_sfx.play()
	gui.play_sound(global.coin_sfx)
	gui.animate("CoinPulse")
	update_gui()
	var multiple_of_coin_target = (coins % coin_target == 0)
	if multiple_of_coin_target:
		life_up()
		update_gui()
		

func life_down():
	#Pain_sfx.play() # TODO find way of wiring in editor
	lives -= 1
	gui.play_sound(global.pain_sfx)
	gui.animate("LifeDown")
	update_gui()
	if lives < 0:  # TODO isn't this off by one? # No - you can have no lives left and play - y
		game_over()


func life_up():
	lives +=1
	gui.animate("LifePulse")
	update_gui()


func game_over():
	get_tree().change_scene(global.EndGame)

	
func update_gui():
	gui.update_gui(coins, lives)	