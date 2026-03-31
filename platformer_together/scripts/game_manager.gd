extends Node

@onready var label: Label = $CanvasLayer/Label
@onready var game_over_animation: AnimationPlayer = $GameOverAnimation
@onready var inventory_ui: InventoryUI  = $CanvasLayer/InventoryUI

@export var inventory: InventoryData

var score: int = 0

func _is_inventory_open() -> bool:
	return inventory_ui.visible

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("inventory"):
		inventory_ui.visible = not inventory_ui.visible
		get_tree().paused = inventory_ui.visible;
		if inventory_ui.visible: 
			inventory_ui.update(inventory)

func game_over():
	game_over_animation.stop()
	game_over_animation.play("game_over")

func restart_game():
	get_tree().reload_current_scene()
	reset_score()
	inventory.clear_items()

func add_score(ammount = 1):
	score += ammount
	update_score_ui()

func reset_score():
	score = 0
	update_score_ui()

func update_score_ui():
	label.text = "Coins: " + str(score)

func player_died():
	game_over()


func _on_timer_timeout() -> void:
	restart_game()
	
