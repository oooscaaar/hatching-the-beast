extends Node2D

@onready var main_menu = preload("res://scenes/menu/main_menu.tscn")
@onready var game_level = preload("res://scenes/game_level/game_level.tscn")
@onready var intro = preload("res://scenes/intro/intro.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var _level = intro.instantiate()
	add_child(_level)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
