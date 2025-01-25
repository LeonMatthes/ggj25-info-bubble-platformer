extends Node

var is_player_1 := true

func load_level(level: PackedScene):
	get_tree().change_scene_to_packed(level)
