extends Node2D

@onready var player := $ParallaxBackground/Player
@onready var parallax := $ParallaxBackground
@onready var timer  := $Timer
@onready var countdown := $Layout/Countdown
@onready var animated_egg := $Layout/AnimatedEgg
@onready var countdown_label := $Layout/Countdown/CountDownLabel


func _ready():
	set_processes([parallax], false)
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
	set_processes([parallax], true)
	animated_egg.play("move")

func set_processes(nodes: Array[Node], enabled: bool) -> void:
	for node in nodes:
		node.set_process(enabled)


func _on_timer_timeout() -> void:
	_start_game()
