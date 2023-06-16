extends StaticBody2D


func _ready() -> void:
	$LeftPlatformTexture.frame = randi_range(8, 9)
	$MidPlatformTexture.frame = randi_range(12,15)
	$RightPlatformTexture.frame = randi_range(10, 11)


