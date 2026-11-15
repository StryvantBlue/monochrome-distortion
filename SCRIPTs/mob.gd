extends CollisionObject2D

@export var AssignedPath:Array[Node2D]

func _ready() -> void:
	if AssignedPath: for i in AssignedPath: i.visible = false

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if AssignedPath: for i in AssignedPath: i.visible = true
		queue_free()
