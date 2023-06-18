extends Node

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")


func _on_quit_pressed() -> void:
	pass # Replace with function body.


func _on_animated_intro_animation_finished() -> void:
	$ParallaxBackground/StaticMeteors.set_visible(false)
	$ParallaxBackground/StaticMeteors2.set_visible(false)
	$ParallaxBackground/Meteors/MeteorsTexture.set_visible(true)
	$ParallaxBackground/Meteors.set_motion_scale(Vector2(0.5,0))
	$ParallaxBackground/PlayBtn.set_visible(true)
	$ParallaxBackground/QuitBtn.set_visible(true)
