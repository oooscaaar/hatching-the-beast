extends Node2D

@onready var player_vars = get_node("/root/PlayerVariables")
@onready var beasts_list = get_node("/root/BeastsDb")

@onready var creatures_thumbnails = [ 
	preload("res://scenes/beasts/creature_1.tscn"),
	preload("res://scenes/beasts/creature_2.tscn"),
	preload("res://scenes/beasts/creature_3.tscn"),
	preload("res://scenes/beasts/creature_4.tscn"),
	preload("res://scenes/beasts/creature_5.tscn"),
	preload("res://scenes/beasts/creature_6.tscn"),
	preload("res://scenes/beasts/creature_7.tscn"),
	preload("res://scenes/beasts/creature_8.tscn"),
]


func _ready() -> void:
	$RarityValueLabel.visible = false
	$NameValueLabel.visible = false
	$CreatureTexture.visible = false
	$HeaderTextTexture.visible = true
	for beast in player_vars.beasts_owned:
		var new_thumbnail = creatures_thumbnails[beast.sprite].instantiate()
		$GridContainer.add_child(new_thumbnail)
		
func _process(delta: float) -> void:
	if player_vars.active_beast_index != null:
		$RarityValueLabel.visible = true
		$RarityValueLabel.text = beasts_list.beasts[player_vars.active_beast_index].rarity
		$NameValueLabel.visible = true
		$NameValueLabel.text = beasts_list.beasts[player_vars.active_beast_index].name
		$CreatureTexture.visible = true
		$CreatureTexture.frame = beasts_list.beasts[player_vars.active_beast_index].sprite
		$HeaderTextTexture.visible = false


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_level/game_level.tscn")


func _on_quit_pressed() -> void:
		get_tree().quit()
