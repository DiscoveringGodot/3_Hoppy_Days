extends Node2D

func _ready():
	Global.GameState = self

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")