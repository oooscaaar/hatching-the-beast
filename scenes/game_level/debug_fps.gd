extends Label

@onready var btn_was_pressed: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = 'FPS: ' + str(Engine.get_frames_per_second())

