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
		# Build dictionary at save time
		var save_data = {
			"count": count
		}
		
		file.store_var(save_data)
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
		var save_data = file.get_var()
		file.close()
		
		# Restore variables from dictionary
		count = save_data["count"]
		
		print("Loaded from slot ", slot, " Count = ", count)
	else:
		print("Failed to load from slot ", slot)





#################### EXAMPLE ####################

#var saved_data = {
	#"coins": 100,
	#"experience": 50,
	#"inventory": {
		#"stone": 10,
		#"iron": 4,
		#"gold": 3
	#},
	#"tiles": [
		#{"pos": Vector2(1,2), "img": "res://icon.svg"},
		#{"pos": Vector2(4,3), "img": "res://icon.svg"}
	#]
#}
