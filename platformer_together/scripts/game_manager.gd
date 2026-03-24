extends Node

@onready var label: Label = $CanvasLayer/Label
@onready var game_over_animation: AnimationPlayer = $GameOverAnimation
@onready var inventory_ui: InventoryUI  = $CanvasLayer/InventoryUI

@export var inventory: InventoryData

var score: int = 0

func _process(delta: float) -> void:
	inventory_ui.update(inventory);

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
	
