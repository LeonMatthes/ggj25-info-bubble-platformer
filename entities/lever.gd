extends Area2D

signal lever_activated()

var activated = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !activated && Input.is_action_just_pressed("player_interact"):
		for body in get_overlapping_bodies():
			if body.is_in_group("players"):
				activated = true
				$Lever_activated.visible = activated
				$Lever_deactivated.visible = !activated
				lever_activated.emit()
				break
