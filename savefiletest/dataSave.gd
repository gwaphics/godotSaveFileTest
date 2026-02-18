extends Node

var count = 0

# Returns the correct file path for a slot
func get_save_path(slot: int) -> String:
	return "user://save_%d.save" % slot

# Save to a slot
func save_game(slot: int):
	var path = get_save_path(slot)
	var file = FileAccess.open(path, FileAccess.WRITE)
	
	if file:
		file.store_var(count)
		file.close()
		print("Saved to slot ", slot)
	else:
		print("Failed to save to slot ", slot)

# Load from a slot
func load_game(slot: int):
	var path = get_save_path(slot)
	
	if not FileAccess.file_exists(path):
		print("Slot ", slot, " is empty.")
		return
	
	var file = FileAccess.open(path, FileAccess.READ)
	
	if file:
		count = file.get_var()
		file.close()
		print("Loaded from slot ", slot, " Count = ", count)
	else:
		print("Failed to load from slot ", slot)
