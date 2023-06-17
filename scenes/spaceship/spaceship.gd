extends Node2D

@onready var animated_egg := $SpaceshipLayout/SpaceshipAnimatedEgg


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_lever_pressed() -> void:
	animated_egg.play("hatch")
	


func _on_spaceship_animated_egg_animation_finished() -> void:
	print("hatched!")
