extends Node

@onready var label: Label = $CanvasLayer/Label
@onready var game_over_animation: AnimationPlayer = $GameOverAnimation


var score: int = 0
var inventory: Array[ItemData] = []



	
func game_over():
	game_over_animation.stop()
	game_over_animation.play("game_over")

func restart_game():
	get_tree().reload_current_scene()
	reset_score()
	
func add_item(item: ItemData):
	inventory.append(item)
	print(inventory)

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
	
