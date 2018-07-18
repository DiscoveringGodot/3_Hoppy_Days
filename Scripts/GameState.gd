extends Node2D

export var starting_lives = 3
var lives
var coins = 0

func _ready():
	Global.GameState = self
	lives = starting_lives
	update_GUI()


func update_GUI():
	Global.GUI.update_GUI(lives)


func hurt():
	lives -= 1
	Global.Player.hurt()
	update_GUI()
	if lives < 0:
		end_game()


func coin_up():
	coins += 1

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
