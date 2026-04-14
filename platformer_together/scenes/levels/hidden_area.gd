extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var light: PointLight2D = $PointLight2D

func _on_reveal_area_body_entered(body: Node2D) -> void:
	if body is Player:
		animation_player.play("reveal_cave")


func _on_reveal_area_body_exited(body: Node2D) -> void:
	if body is Player:
		animation_player.play("reveal_cave", -1, -1, true)

func _on_light_reveal_body_entered(body: Node2D) -> void:
	if body is Player:
		var tween = get_tree().create_tween()
		tween.tween_property(light,"energy", 1.5, 4).set_ease(Tween.EASE_OUT)
		tween.tween_callback(play_sound).set_delay(3)
		
		#point_light_2d.enabled = true;

func play_sound():
	print("pief")
	pass

#func _on_light_reveal_body_exited(body: Node2D) -> void:
	#if body is Player:
		#point_light_2d.enabled = false;
