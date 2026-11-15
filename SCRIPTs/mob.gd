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
			queue_free()
