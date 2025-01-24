extends Node2D



func _on_player_1_selected() -> void:
	Globals.is_player_1 = true

func _on_player_2_selected() -> void:
	Globals.is_player_1 = false
