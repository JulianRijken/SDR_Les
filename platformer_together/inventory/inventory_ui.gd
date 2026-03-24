extends Control
class_name InventoryUI

@onready var grid_container: GridContainer = $Panel/MarginContainer/GridContainer
const SLOT_UI = preload("uid://cc0v1ih1lelou")

func update(inventory: InventoryData) -> void:
	for child in grid_container.get_children():
		grid_container.remove_child(child)
		child.queue_free() 
	
	for i in inventory.item_count():
		var new_slot: SlotUI = SLOT_UI.instantiate()
		grid_container.add_child(new_slot)
		
		var item_data: ItemData = inventory.items[i]
		if item_data != null:
			new_slot.texture_rect.texture = item_data.texture
