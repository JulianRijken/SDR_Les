extends Resource
class_name InventoryData

@export var items: Array[SlotData]

func add_item(item_to_add: ItemData) -> bool:
	var target_slot: SlotData = has_item(item_to_add)
	if target_slot != null:
		target_slot.quanity += 1
		return true
	else:
		for slot_data: SlotData in items:
			if slot_data == null:
				slot_data = SlotData.new()
				slot_data.item_data = item_to_add # THIS IS TEMP!!!
				return true
				
	return false
	
func has_item(target_item_data: ItemData) -> SlotData:
	for slot_data: SlotData in items:
		if slot_data != null:
			if slot_data.item_data == target_item_data:
				return slot_data
	return null
	
func clear_items():
	items.clear()
	items.resize(24)
	
func item_count() -> int:
	return items.size()
	
