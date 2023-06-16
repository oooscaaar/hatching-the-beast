extends StaticBody2D


func _ready() -> void:
	$LeftPlatformTexture.frame = randi_range(8, 9)
	$LeftPlatformTexture.frame = randi_range(10, 11)

