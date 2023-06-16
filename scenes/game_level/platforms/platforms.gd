extends Node2D

var platform_scenes := [preload("res://scenes/game_level/platforms/1_platform.tscn"), preload("res://scenes/game_level/platforms/2_platform.tscn")]


func _on_enter_screen_area_exited(area: Area2D) -> void:
	var last_platform = area.get_parent()
	_generate_new_platform(last_platform)
	
	
func _generate_new_platform(last_platform: Node) -> Node:
	var last_platform_position = last_platform.get_position()
	var new_platform = platform_scenes[randi() % 2].instantiate()
	var last_platform_width = last_platform.get_node("CollisionArea").shape.get_size().x
	# ADD MAGIC MATRIX OFFSET HERE IN THE SUM
	new_platform.position = Vector2(last_platform_position.x + last_platform_width +16, last_platform_position.y)
	call_deferred("add_child", new_platform)
	return new_platform
