extends CharacterBody3D

@export var speed = 14
@export var jump_strenght = 20
@export var max_extra_jumps : int = 2

var times_jumped = 0
var target_velocity = Vector3.ZERO

#func _ready() -> void:
	#Engine.max_fps = 5

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_backwards"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		
	print(times_jumped)
		
	if is_on_floor():
		times_jumped = 0
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or times_jumped <= 1:
			direction.y += jump_strenght
			times_jumped += 1
		
	
	velocity = direction * speed
	velocity.y -= 1.81
	
	move_and_slide()
	
	# Prevent player from falling infenetly by respawning
	var is_onder_map = position.y <= -10
	if is_onder_map:
		position = Vector3(0,0,0)
