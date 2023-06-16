extends StaticBody2D


func _ready() -> void:
	$LeftPlatformTexture.frame = randi_range(8, 9)
	$Mid1PlatformTexture.frame = randi_range(12,15)
	$Mid2PlatformTexture.frame = randi_range(12,15)
	$Mid2PlatformTexture.frame = randi_range(12,15)
	$RightPlatformTexture.frame = randi_range(10, 11)
