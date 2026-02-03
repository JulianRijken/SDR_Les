extends Area2D

@onready var game_manager: Node = %GameManager
@onready var pickup_sound: AudioStreamPlayer2D = $PickupSound
@onready var pickup_animation: AnimationPlayer = $PickupAnimation

func _on_body_entered(_body: Node2D) -> void:
	game_manager.add_score()
	pickup_animation.play("coin_pickup")
	#pickup_sound.play()
	#queue_free()
