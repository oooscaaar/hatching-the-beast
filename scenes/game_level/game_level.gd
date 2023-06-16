extends Node2D

@onready var platforms: Node2D = $Platforms

var platform_scenes := [preload("res://scenes/game_level/platforms/platform_single.tscn"), preload("res://scenes/game_level/platforms/platform_double.tscn")]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _generate_new_platform(last_platform: Node) -> Node:
	var last_platform_position = last_platform.get_position()
	var new_platform = platform_scenes[randi() % 2].instantiate()
	var last_platform_width = last_platform.get_node("CollisionArea").shape.get_size().x
	# ADD MAGIC MATRIX OFFSET HERE IN THE SUM
	new_platform.position = Vector2(last_platform_position.x + last_platform_width, last_platform_position.y)
	platforms.call_deferred("add_child", new_platform)
	return new_platform


func _on_enter_screen_area_area_exited(area: Area2D) -> void:
	var last_platform = area.get_parent()
	_generate_new_platform(last_platform)
