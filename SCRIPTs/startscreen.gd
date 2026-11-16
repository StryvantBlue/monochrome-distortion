extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action("start"):
		get_tree().change_scene_to_file("res://SCENEs/explain_screen.tscn")
