extends Node2D

@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var s_off: Sprite2D = $sprite_nonclick
@onready var s_on: Sprite2D = $sprite_click

var sounds: Array[AudioStream] = [
	preload("res://SFXs/Backspace1.wav"),
	preload("res:///SFXs/Backspace2.wav"),
	preload("res:///SFXs/Backspace3.wav")
]

var handle_pivot := Vector2(30, -25)

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
func _process(delta: float) -> void:
	global_position = get_global_mouse_position() + handle_pivot
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			s_on.visible = true
			s_off.visible = false
			audio_player.stream = sounds.pick_random()
			audio_player.play()
		else:
			s_on.visible = false
			s_off.visible = true
