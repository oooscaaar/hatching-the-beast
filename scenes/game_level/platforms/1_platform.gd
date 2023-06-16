extends StaticBody2D


func _ready() -> void:
	$PlatformTexture.frame = randi_range(0, 7)
