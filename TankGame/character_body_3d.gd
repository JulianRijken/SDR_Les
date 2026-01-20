extends CharacterBody3D

@export var speed = 14
@export var jump_strenght = 20
@export var max_extra_jumps : int = 2
@export var fire_point : Node3D

var times_jumped = 0
var target_velocity = Vector3.ZERO

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var scene = load("res://bullet.tscn")
		var instance : Node3D = scene.instantiate()
		get_parent().add_child(instance)
		
		instance.position = fire_point.global_position;
		instance.rotation = fire_point.global_rotation;
	
	DebugDraw3D.draw_arrow_ray(fire_point.global_position, -fire_point.global_basis.z, 10, Color.WHITE, 0.1)
	
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
		
	#print(times_jumped)
		
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
