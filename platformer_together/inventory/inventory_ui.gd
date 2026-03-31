extends Control
class_name InventoryUI

@onready var grid_container: GridContainer = $MarginContainer/GridContainer
const SLOT_UI = preload("uid://cc0v1ih1lelou")

func update(inventory: InventoryData) -> void:
	for child in grid_container.get_children():
		grid_container.remove_child(child)
		child.queue_free() 
	
	for slot_data: SlotData in inventory.items:
		var slot: SlotUI = SLOT_UI.instantiate()
		grid_container.add_child(slot)
		
		if slot_data != null:
			slot.texture_rect.texture = slot_data.item_data.texture

		
