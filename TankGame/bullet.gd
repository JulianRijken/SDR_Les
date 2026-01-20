extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(global_position)
	apply_central_impulse(-transform.basis.z * 20)
	pass
