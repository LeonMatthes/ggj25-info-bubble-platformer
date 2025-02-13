extends Area2D

@export var next_level_alice: String
@export var next_level_bob: String
@export var key_alice: Key
@export var key_bob: Key

var other_key : Key

func _ready():
	other_key = key_bob if Globals.is_player_1 else key_alice
	var label = OS.get_keycode_string(other_key)
	$Label.text = label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var key = key_alice if Globals.is_player_1 else key_bob

	if Input.is_key_pressed(key):
		for body in get_overlapping_bodies():
			if body.is_in_group("players"):
				var next_level = next_level_alice if Globals.is_player_1 else next_level_bob
				Globals.prev_key_other = other_key
				get_tree().change_scene_to_packed(load(next_level))
				break
