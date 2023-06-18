extends Node2D

@onready var player_vars = get_node("/root/PlayerVariables")
@onready var beasts_list = get_node("/root/BeastsDb")


func _ready() -> void:
	var hatched_beast = _unlock_beast(player_vars.last_score_in_time, beasts_list)
	player_vars.beasts_owned.append(hatched_beast)
	$Layout/MarginContainer/Beast.set_frame(hatched_beast.sprite)
	$Layout/CreatureNameValue.text = hatched_beast.name
	$Layout/CreatureRarityValue.text = hatched_beast.rarity
	
	
func _unlock_beast(player_score_in_time: float, possible_beasts) -> Dictionary:
	# TODO: Use player time spent to calculate the odds so the rarity of the returned creature matches the player socore.
	# We are provisionally returning a random creature, no matter the score
	return possible_beasts.beasts[randi_range(0, len(possible_beasts.beasts)-1)]


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/beasts/beasts.tscn")


func _on_play_again_button_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/game_level/game_level.tscn")
