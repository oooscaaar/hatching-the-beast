extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enter_screen_area_body_exited(body):
	print("hey node")


func _on_enter_screen_area_area_exited(area):
	print("hey area")
