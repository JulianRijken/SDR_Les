extends CharacterBody3D

@export var speed = 14

var target_velocity = Vector3.ZERO

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
		
	print(direction)
	
	velocity = direction
	move_and_slide()
