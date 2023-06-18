extends Node

const SAVE_FILE = "user://save_file.save"

var game_data ={}

func _ready() -> void:
	load()

func save(content):
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(content)

func load():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	return content
