extends CollisionObject2D

@export var AssignedPath:Array[Node2D]
@export var ConnectedBugs:Array[Node2D]
@export var CanBeKilled:bool = false

func _ready() -> void:
	if AssignedPath: for i in AssignedPath: if i.name != "START": i.visible = false

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if CanBeKilled:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if AssignedPath: for i in AssignedPath: i.visible = true
			if ConnectedBugs: for i in ConnectedBugs: if i: i.CanBeKilled = true
			if name == "FINISH":
				Engine.time_scale = 0.1
				get_node("/root/Main/MouseCursor").visible = false
				get_node("/root/Main/DarkPanel").visible = true
				await get_tree().create_timer(0.2).timeout
				Engine.time_scale = 1
				get_tree().change_scene_to_file("res://SCENEs/win.tscn")
			elif name.contains("LOSS"):
				Engine.time_scale = 0.1
				get_node("/root/Main/MouseCursor").visible = false
				get_node("/root/Main/DarkPanel").visible = true
				await get_tree().create_timer(0.5).timeout
				Engine.time_scale = 1
				get_tree().reload_current_scene()
			else:
				queue_free()
