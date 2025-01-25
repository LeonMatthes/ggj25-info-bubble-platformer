extends TileMapLayer

func _ready() -> void:
	self.visible = false
	self.collision_enabled = false

func appear() -> void:
	self.visible = true
	self.collision_enabled = true
