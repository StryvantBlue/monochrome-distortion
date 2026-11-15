extends Sprite2D

var rest_angle: float
var rest_offset := Vector2(-5, 30)
var click_offset := Vector2(-28, 9)
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _input(event: InputEvent) -> void:
	rest_angle = -45
	rest_offset = offset
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			rotation_degrees = rest_angle -60
			offset = click_offset
		else:
			rotation_degrees = rest_angle
			offset = rest_offset
