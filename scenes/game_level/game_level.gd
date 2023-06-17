extends Node2D

@onready var player := $ParallaxBackground/Player
@onready var parallax := $ParallaxBackground
@onready var platforms := $ParallaxBackground/Platforms
@onready var timer  := $Timer
@onready var hatching_timer := $HatchingTimer
@onready var countdown := $Layout/Countdown
@onready var animated_egg := $Layout/AnimatedEgg
@onready var countdown_label := $Layout/Countdown/CountDownLabel


func _ready():
	_set_processes([parallax], false)
	animated_egg.stop()
	timer.start()
	countdown.show()

func _process(delta):
	if snapped(timer.time_left, 1) != 0:
		countdown_label.text = str(snapped(timer.time_left, 1))
	else:
		countdown_label.text = 'Go!'


func _start_game() -> void:
	countdown.hide()
	countdown_label.hide()
	_set_processes([parallax], true)
	animated_egg.play("move")


func _gameover() -> void:
	_hide_nodes([$Layout])
	$ParallaxBackground/Platforms.queue_free()
	$Gameover.show()
	
	
func _game_won() -> void:
	get_tree().change_scene_to_file("res://MainMenu.tscn")
	
	

func _hide_nodes(nodes: Array[Node]) -> void:
	for node in nodes:
		node.hide()


func _set_processes(nodes: Array[Node], enabled: bool) -> void:
	for node in nodes:
		node.set_process(enabled)


func _on_timer_timeout() -> void:
	_start_game()


func _on_death_area_body_exited(body):
	_gameover()


func _on_hatching_timer_timeout() -> void:
	# Spawn spaceship
	pass


func _on_green_button_pressed() -> void:
	hatching_timer.start()
	# Fire spacecommander animation
	# 


func _on_play_again_button_pressed() -> void:
	get_tree().reload_current_scene()
