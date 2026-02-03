extends Node

@onready var label: Label = $CanvasLayer/Label

var score: int = 0

func end_game():
	print("Game Over")

func add_score():
	score += 1
	label.text = "Coins: " + str(score)
