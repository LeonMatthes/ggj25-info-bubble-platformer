extends CharacterBody2D

const SPEED = 100
const ACCEL = 300.0
const JUMP_VELOCITY = -270.0
const AIR_ACCEL = 5.0
const DASH_SPEED = 400

var has_dashed = false

func _ready():
	if Globals.is_player_1:
		$P1Sprite.visible = true
		$P2Sprite.visible = false
	else:
		$P1Sprite.visible = false
		$P2Sprite.visible = true
	
func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Dashing
	if is_on_floor():
		has_dashed = false
	var dash_direction = Input.get_axis("player_dash_left", "player_dash_right")
	if !is_on_floor() && !has_dashed && dash_direction != 0:
		var dash_force = DASH_SPEED * dash_direction
		velocity.x += dash_force
		has_dashed = true

	# Left/Right Movement
	var direction := Input.get_axis("player_left", "player_right")
	if is_on_floor():
		# Friction
		velocity.x *= 0.7
		if direction != 0.0:
			var target_speed = direction * maxf(SPEED, absf(velocity.x))
			velocity.x = move_toward(velocity.x, target_speed, ACCEL)
	else:
		# Air resistance
		velocity.x *= 0.95
		if direction != 0.0:
			velocity.x += direction * AIR_ACCEL
		
	
	move_and_slide()
	
	if !is_on_floor():
		$AnimationPlayer.play("jump")
	else:
		if absf(velocity.x) >= 5:
			$AnimationPlayer.play("walk")
		else:
			$AnimationPlayer.play("stand")
	if velocity.x < -10:
		$P1Sprite.scale.x = 1
		$P2Sprite.scale.x = 1
	if velocity.x > 10:
		$P1Sprite.scale.x = -1
		$P2Sprite.scale.x = -1
