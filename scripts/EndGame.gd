extends Node2D

export var starting_level = Scene("")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level 1.tscn")