extends Node2D

@export var coins: int = 0
@export var has_item: bool
@export var item_type: GameManager.ItemType

@export var coin_texture: Texture
@export var key_texture: Texture

@onready var chest_sprite: AnimatedSprite2D = $ChestSprite
@onready var chest_open_sound: AudioStreamPlayer2D = $ChestOpenSound
@onready var item_sprite: Sprite2D = $ItemSprite
@onready var item_animation: AnimationPlayer = $ItemAnimation


func _on_interactable_interacted() -> void:
	chest_sprite.play("open")
	chest_open_sound.play()
	item_animation.play("item_reveal")

	if has_item:
		item_sprite.texture = key_texture
		GameManager.add_item(item_type)
	else:
		item_sprite.texture = coin_texture
		GameManager.add_score(coins)
	pass
