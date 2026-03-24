extends Resource
class_name InventoryData

@export var items: Array[ItemData]

func add_item(item_to_add: ItemData):
	for index in items.size():
		var item : ItemData = items[index]
		if item == null:
			items[index] = item_to_add
			break

func has_item(item: ItemData):
	pass
	
func clear_items():
	items.clear()
	items.resize(24)
	
func item_count() -> int:
	return items.size()
	
