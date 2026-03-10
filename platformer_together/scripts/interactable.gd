extends Area2D

@onready var show_animation: AnimationPlayer = $ShowAnimation
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var in_area : bool = false
signal interacted

func _on_body_entered(body: Node2D) -> void:
	show_animation.play("show_info")
	in_area = true
	pass


func _on_body_exited(body: Node2D) -> void:
	show_animation.play("show_info", -1, -1, true)
	in_area = false
	pass

func _input(event: InputEvent) -> void:
	if in_area and event.is_action_pressed("Interact"):
		collision_shape_2d.disabled = true
		show_animation.play("show_info", -1, -1, true)
		
		interacted.emit()
	
