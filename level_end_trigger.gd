extends Area2D

@export var next_level_alice: String
@export var next_level_bob: String
var exit_ready

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_ready = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(Key.KEY_ENTER) && exit_ready:
		var next_level = next_level_alice if Globals.is_player_1 else next_level_bob
		get_tree().change_scene_to_packed(load(next_level))


func _on_body_entered(body: Node2D) -> void:
	exit_ready = true

func _on_body_exited(body: Node2D) -> void:
	exit_ready = false
