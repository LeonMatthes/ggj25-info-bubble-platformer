extends Area2D

@export var next_level: String
var exit_ready

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_ready = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(Key.KEY_ENTER) && exit_ready:
		get_tree().change_scene_to_packed(load("res://levels/Rob.tscn"))


func _on_body_entered(body: Node2D) -> void:
	exit_ready = true

func _on_body_exited(body: Node2D) -> void:
	exit_ready = false
