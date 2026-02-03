class_name Player
extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

var rng = RandomNumberGenerator.new()

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var death_sound: AudioStreamPlayer2D = $DeathSound

func damage(damage: int) -> void:
	print("Player Damaged " + str(damage))
	kill();

func kill() -> void:
	print("Player Killed")
	death_sound.play()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.pitch_scale = rng.randf_range(0.4, 0.8)
		jump_sound.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip sprite to direction
	if direction > 0:
		sprite.flip_h = false
	if direction < 0:
		sprite.flip_h = true
	
	# Animate player
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("walk")
	else:
		sprite.play("jump")
	
	# Apply input to velocity
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
