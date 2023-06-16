extends Node2D

var platform_scenes := [
	preload("res://scenes/game_level/platforms/1_platform.tscn"),
	preload("res://scenes/game_level/platforms/2_platform.tscn"),
	preload("res://scenes/game_level/platforms/3_platform.tscn"),
	preload("res://scenes/game_level/platforms/4_platform.tscn"),
	preload("res://scenes/game_level/platforms/5_platform.tscn"),
	preload("res://scenes/game_level/platforms/6_platform.tscn"),
	]
	
const GRID_SIZE = 16
const MAX_PLATFORM_HEIGHT = 80
const MIN_PLATFORM_HEIGHT = 240

const feasible_landing_target_coordinates = {
	0: [-32, [1, 2]],
	1: [-16, [1, 2, 3]],
	2: [0, [1, 2, 3, 4]],
	3: [16,[0,1,2,3,4]],
	4: [32, [1, 2, 3, 4, 5]],
	5: [48, [1, 2, 4, 5]],
	6: [64, [2, 3, 4, 5]],
	7: [80, [2, 3, 4, 5, 6]],
	8: [96, [2, 3, 4, 5, 6]],
	9: [112, [3, 4, 5, 6]],
	10: [128, [3, 4, 5, 6]],
	11: [144, [3, 4, 5, 6, 7]],
}


func _on_enter_screen_area_exited(area: Area2D) -> void:
	var last_platform = area.get_parent()
	_generate_new_platform(last_platform)


func _generate_new_platform_offset(last_platform_position, last_platform_width) -> Vector2i:
	var last_platform_is_max_height: bool = last_platform_position.y <= MAX_PLATFORM_HEIGHT
	var last_platform_is_min_height: bool = last_platform_position.y >= MIN_PLATFORM_HEIGHT

	var offset: Vector2i
	var height_in_grid_units: int
	var width_in_grid_units: int

	if last_platform_is_max_height:
		height_in_grid_units = randi_range(2, 11)

	if last_platform_is_min_height:
		height_in_grid_units = randi_range(0, 2)

	if !last_platform_is_max_height and !last_platform_is_min_height:
		# Bias the algorithm so it tends to climb
		var go_up := randi_range(1, 10) != 1
		if go_up:
			height_in_grid_units = randi_range(0, 1)
		else:
			height_in_grid_units = randi_range(2, 11)
			while height_in_grid_units >= MAX_PLATFORM_HEIGHT:
				height_in_grid_units = randi_range(2, 11)

	width_in_grid_units = feasible_landing_target_coordinates[height_in_grid_units][1][randi_range(0, len(feasible_landing_target_coordinates[height_in_grid_units][1]) - 1)]
	return Vector2i((width_in_grid_units + 1) * GRID_SIZE, feasible_landing_target_coordinates[height_in_grid_units][0])


func _generate_new_platform(last_platform: Node) -> Node:
	var last_platform_position = last_platform.get_position()
	var last_platform_width = last_platform.get_node("CollisionArea").shape.get_size().x

	var new_platform = platform_scenes[randi() % 6].instantiate()
	var new_platform_offset = _generate_new_platform_offset(last_platform_position, last_platform_width)
	new_platform.position = Vector2i(last_platform.get_position().x + last_platform_width +  new_platform_offset.x , last_platform_position.y +  new_platform_offset.y)
	call_deferred("add_child", new_platform)
	return new_platform
