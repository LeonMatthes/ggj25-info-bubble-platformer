extends Area2D

@export var next_level_alice: String
@export var next_level_bob: String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("player_interact"):
		for body in get_overlapping_bodies():
			if body.is_in_group("players"):
				var next_level = next_level_alice if Globals.is_player_1 else next_level_bob
				get_tree().change_scene_to_packed(load(next_level))
				break
