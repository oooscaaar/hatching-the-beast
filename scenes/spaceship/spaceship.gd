extends Node2D

@onready var animated_egg := $SpaceshipLayout/SpaceshipAnimatedEgg

func _ready() -> void:
	$"/root/BackgroundMusic".volume_db = -15
	$SpaceshipSnd.play()

func _on_lever_pressed() -> void:
	$EggCrackPlayer.play()
	animated_egg.play("hatch")
	


func _on_spaceship_animated_egg_animation_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/hatch_result/hatch_result.tscn")
