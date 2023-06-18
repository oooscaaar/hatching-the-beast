extends Node

@onready var beasts_list = get_node("/root/BeastsDb")
@onready var player_vars = get_node("/root/PlayerVariables")

func _on_mouse_entered() -> void:
	player_vars.active_beast_index = 4
