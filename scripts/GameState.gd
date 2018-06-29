extends Node2D

var coins = 0
var coin_count = 0 # how close are we to coin_target - resets to zero every time we reach it 
var lives = 0
var gui= ""
export var coin_target = 20   # How many coins for an extra life?
export var starting_lives = 3
export(NodePath)  var GUI_REF

#export(PackedScene)  var EndGameRef

func _ready():
	lives = starting_lives
	gui = get_node(str(GUI_REF))
	update_gui()
	
func coin_up():
	coins += 1
	coin_count += 1
	print(coins)
	#$Coin_sfx.play()
	gui.animate("CoinPulse")
	if coin_count >= coin_target:
		life_up()
		update_gui()
		

func life_down(lives):
	$Pain_sfx.play()  # TODO find way of wiring in editor
	lives -= 1
	gui.animate("LifeDown")
	update_gui()
	if lives < 0: # TODO isn't this off by one? # No - you can have no lives left and play - y
		_end_game()



func life_up():
	lives +=1
	coin_count = 0
	gui.animate("LifePulse")
	update_gui(coins, lives)

#func game_over():
#	change_scene_to(EndGame)

func update_gui():
	var gui = get_node(str(GUI_REF))
	gui.update_gui(coins, lives)	