extends CanvasLayer

@onready var closed_hand_cursor = preload("res://assets/sprites/shared/black-closed-hand-cursor.png")
@onready var open_hand_cursor = preload("res://assets/sprites/shared/black-hand-cursor.png")
@onready var arrow_cursor = preload("res://assets/sprites/shared/black-arrow-cursor.png")

func _on_lever_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(open_hand_cursor, Input.CURSOR_ARROW, Vector2(16,16))


func _on_lever_mouse_exited() -> void:
		Input.set_custom_mouse_cursor(arrow_cursor, Input.CURSOR_ARROW, Vector2(16,16))


func _on_lever_button_down() -> void:
	Input.set_custom_mouse_cursor(closed_hand_cursor, Input.CURSOR_ARROW, Vector2(16,16))


func _on_lever_button_up() -> void:
	Input.set_custom_mouse_cursor(arrow_cursor, Input.CURSOR_ARROW, Vector2(16,16))
