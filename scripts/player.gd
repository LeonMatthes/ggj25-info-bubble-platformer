extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -700.0
const AIR_ACCEL = 30

var dash_cooldown = 0
const DASH_DURATION = 0.3

func _ready():
	#var player = Player1.instance()
	#var sprite = player.get_node("Sprite2D")
	
	if Globals.is_player_1:
		$Sprite2D.modulate = Color.RED
	else:
		$Sprite2D.modulate = Color.GREEN
	
	
func _physics_process(delta: float) -> void:
	#is_on_floor() = true
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Dashing
	if dash_cooldown > 0:
		dash_cooldown -= delta
	var dash_direction = Input.get_axis("player_dash_left", "player_dash_right")
	if !is_on_floor() && dash_cooldown <= 0 && dash_direction != 0:
		var dash_force = 1000 * dash_direction
		velocity.x += dash_force
		dash_cooldown = DASH_DURATION

	# Left/Right Movement
	var direction := Input.get_axis("player_left", "player_right")
	if is_on_floor():
		# Friction
		velocity.x *= 0.7
		if direction != 0.0:
			velocity.x = direction * maxf(SPEED, absf(velocity.x))
	else:
		# Air resistance
		velocity.x *= 0.95
		if direction != 0.0:
			velocity.x += direction * AIR_ACCEL
		
	
	move_and_slide()
