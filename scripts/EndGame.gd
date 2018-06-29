extends Node2D


func _on_TextureButton_pressed():
	var level1 = get_node(global.Level1)
	get_tree().change_scene(level1)