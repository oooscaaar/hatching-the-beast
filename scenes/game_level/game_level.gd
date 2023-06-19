extends Node2D

@onready var player := $ParallaxBackground/Player
@onready var parallax := $ParallaxBackground
@onready var platforms := $ParallaxBackground/Platforms
@onready var start_countdown_timer  := $StartCountdownTimer
@onready var spaceship_wait_timer := $SpaceshipWaitTimer
@onready var enable_hatching_timer := $EnableHatchingTimer
@onready var instructions_timer := $InstructionsTimer
@onready var countdown := $Layout/Countdown
@onready var instructions := $Layout/Instructions
@onready var animated_egg := $Layout/AnimatedEgg
@onready var countdown_label := $Layout/Countdown/CountDownLabel
@onready var player_vars = get_node("/root/PlayerVariables")


var elapsed_time := 0.0

func _ready():
	_set_processes([parallax], false)
	animated_egg.stop()
	if not player_vars.has_read_instructions:
		instructions_timer.start()
		instructions.show()
		player_vars.has_read_instructions = true
		$"/root/BackgroundMusic".volume_db = -20
		$AudioPlayer.play()
	else:
		start_countdown_timer.start()
		enable_hatching_timer.start()
		countdown.show()
	

func _process(delta):
	elapsed_time += delta
	if snapped(start_countdown_timer.time_left, 1) != 0:
		countdown_label.text = str(snapped(start_countdown_timer.time_left, 1))
	else:
		countdown_label.text = 'Go!'

func get_elapsed_time() -> float:
	return elapsed_time

func _start_game() -> void:
	countdown.hide()
	countdown_label.hide()
	_set_processes([parallax], true)
	animated_egg.play("move")


func _gameover() -> void:
	_hide_nodes([$Layout])
	$ParallaxBackground/Platforms.queue_free()
	$Gameover.show()
	

func _hide_nodes(nodes: Array[Node]) -> void:
	for node in nodes:
		node.hide()


func _set_processes(nodes: Array[Node], enabled: bool) -> void:
	for node in nodes:
		node.set_process(enabled)


func _on_timer_timeout() -> void:
	$"/root/BackgroundMusic".volume_db = -15
	_start_game()


func _on_death_area_body_exited(body):
	_gameover()


func _on_green_button_pressed() -> void:
	spaceship_wait_timer.start()
	# TODO: Play spacecommander indications: "Spaceship on the way..."
	$Layout/BtnMarginContainer/GreenBtn.disabled = true
	$Layout/BtnMarginContainer/BtnAudioPlayer.play()
	


func _on_play_again_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_enable_hatching_timer_timeout() -> void:
	$Layout/BtnMarginContainer/GreenBtn.disabled = false
	#TODO: Play spaceommander explanation: "You can now hatch..."


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/beasts/beasts.tscn")


func _on_hatching_timer_timeout() -> void:
	player_vars.last_score_in_time = elapsed_time


func _on_instructions_timer_timeout() -> void:
	start_countdown_timer.start()
	enable_hatching_timer.start()
	countdown.show()
	instructions.hide()
	$AudioPlayer.stop()


func _on_death_area_body_entered(body: Node2D) -> void:
	$DeathAudio.play()
	

func _on_audio_toggle_toggled(button_pressed: bool) -> void:
	if button_pressed:
		$"/root/BackgroundMusic".stop()
	else:
		$"/root/BackgroundMusic".play()
