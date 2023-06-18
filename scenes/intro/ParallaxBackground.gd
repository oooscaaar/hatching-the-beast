extends ParallaxBackground

@export var speed : int = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	$Meteors.set_motion_scale(Vector2(0,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= speed * delta

