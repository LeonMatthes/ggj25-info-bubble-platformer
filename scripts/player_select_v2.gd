extends Node2D


func _on_player_1_selected() -> void:
	Globals.is_player_1 = true
	get_tree().change_scene_to_packed(preload("res://levels/levels_v2/level_v2_start_Alice.tscn"))

func _on_player_2_selected() -> void:
	Globals.is_player_1 = false
	get_tree().change_scene_to_packed(preload("res://levels/levels_v2/level_v2_start_Bob.tscn"))
