extends CanvasLayer

@onready var arrow_cursor = preload("res://assets/sprites/shared/black-arrow-cursor.png")
@onready var closed_hand_cursor = preload("res://assets/sprites/shared/black-closed-hand-cursor.png")
@onready var finger_cursor = preload("res://assets/sprites/shared/black-finger-cursor.png")
@onready var open_hand_cursor = preload("res://assets/sprites/shared/black-hand-cursor.png")


func _on_green_button_mouse_entered() -> void:
	if not $BtnMarginContainer/GreenBtn.disabled:
		Input.set_custom_mouse_cursor(finger_cursor, Input.CURSOR_ARROW, Vector2(16,16))


func _on_green_button_mouse_exited() -> void:
		Input.set_custom_mouse_cursor(arrow_cursor, Input.CURSOR_ARROW, Vector2(16,16))
