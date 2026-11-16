extends Label
@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	visible = not visible
	timer.start()
