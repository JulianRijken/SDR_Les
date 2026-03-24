extends Area2D

@onready var show_animation: AnimationPlayer = $ShowAnimation
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@export var is_interactable: bool = true

var in_area : bool = false
signal interacted
signal entered
signal exited

func _on_body_entered(body: Node2D) -> void:
	if is_interactable:
		show_animation.play("show_info")
	in_area = true
	entered.emit()
	print("Emit")
	pass


func _on_body_exited(body: Node2D) -> void:
	if is_interactable:
		show_animation.play("show_info", -1, -1, true)
	in_area = false
	exited.emit()
	pass

func _input(event: InputEvent) -> void:
	if is_interactable == false:
		return
	
	if in_area and event.is_action_pressed("Interact"):
		collision_shape_2d.disabled = true
		show_animation.play("show_info", -1, -1, true)
		
		interacted.emit()
	
