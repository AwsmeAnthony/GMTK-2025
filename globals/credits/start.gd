extends CanvasLayer


func _on_button_pressed() -> void:
	Global.world_type = 0
	get_tree().change_scene_to_file("res://world/world1/world.tscn")
