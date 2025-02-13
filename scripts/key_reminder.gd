extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.is_player_1:
		self.text = self.text.replace("[self]", "Alice").replace("[other]", "Bob")
	else:
		self.text = self.text.replace("[self]", "Bob").replace("[other]", "Alice")
	self.text = self.text.replace("[key]", OS.get_keycode_string(Globals.prev_key_other))
