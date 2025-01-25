extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Globals.is_player_1:
		self.text = "Wait for instructions from Player 1!"

static var player_1_level = preload("res://levels/level1_1.tscn")
static var player_2_level = preload("res://levels/level1_2.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Globals.is_player_1 && Input.is_key_pressed(Key.KEY_C):
		get_tree().change_scene_to_packed(player_2_level)
	if Globals.is_player_1 && Input.is_key_pressed(Key.KEY_G):
		get_tree().change_scene_to_packed(player_1_level)

func _go_back_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://Menus/PlayerSelect.tscn"))
