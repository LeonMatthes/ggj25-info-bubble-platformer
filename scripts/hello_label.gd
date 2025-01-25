extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.is_player_1:
		self.text = self.text.replace("[self]", "Player 1").replace("[other]", "Player 2")
	else:
		self.text = self.text.replace("[self]", "Player 2").replace("[other]", "Player 1")
