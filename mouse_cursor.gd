extends Sprite2D

@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

var sounds: Array[AudioStream] = [
	preload("res://Backspace1.wav"),
	preload("res://Backspace2.wav"),
	preload("res://Backspace3.wav")
]

var rest_angle: float
var handle_pivot := Vector2(0, 30)
var hit_angle: float = -95

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	rest_angle = rotation_degrees
func _process(delta: float) -> void:
	global_position = get_global_mouse_position() + handle_pivot
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			rotation_degrees = hit_angle
			audio_player.stream = sounds.pick_random()
			audio_player.play()
		else:
			rotation_degrees = rest_angle
