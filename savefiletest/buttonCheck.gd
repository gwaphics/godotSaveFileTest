extends Node



func _on_pressed() -> void:
	dataSave.save_game(1)
func _on_save_2_pressed() -> void:
	dataSave.save_game(2)
func _on_save_3_pressed() -> void:
	dataSave.save_game(3)

func _on_load_1_pressed() -> void:
	dataSave.load_game(1)
func _on_load_2_pressed() -> void:
	dataSave.load_game(2)
func _on_load_3_pressed() -> void:
	dataSave.load_game(3)
