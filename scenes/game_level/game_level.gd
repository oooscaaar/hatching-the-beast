extends Node2D

@onready var arrow_cursor = preload("res://assets/sprites/shared/black-arrow-cursor.png")
@onready var closed_hand_cursor = preload("res://assets/sprites/shared/black-closed-hand-cursor.png")
@onready var finger_cursor = preload("res://assets/sprites/shared/black-finger-cursor.png")
@onready var open_hand_cursor = preload("res://assets/sprites/shared/black-hand-cursor.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_green_button_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(finger_cursor, Input.CURSOR_ARROW, Vector2(16,16))


func _on_green_button_mouse_exited() -> void:
		Input.set_custom_mouse_cursor(arrow_cursor, Input.CURSOR_ARROW, Vector2(16,16))
