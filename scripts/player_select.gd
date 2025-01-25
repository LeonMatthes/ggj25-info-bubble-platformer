extends Node2D

var next_level := preload("res://Menus/PlayerInstructions.tscn")

func _on_player_1_selected() -> void:
	Globals.is_player_1 = true
	get_tree().change_scene_to_packed(next_level)

func _on_player_2_selected() -> void:
	Globals.is_player_1 = false
	get_tree().change_scene_to_packed(next_level)
