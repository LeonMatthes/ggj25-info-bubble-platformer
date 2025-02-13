extends Node

var is_player_1 := true
var prev_key_other : Key = KEY_ESCAPE

func load_level(level: PackedScene):
	get_tree().change_scene_to_packed(level)
