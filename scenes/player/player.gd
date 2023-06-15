extends RigidBody2D

@onready var _ground_raycast = $GroundRaycast
@onready var _animated_player = $AnimatedPlayer

var is_running: bool = false
var is_grounded: bool = false
var is_idle: bool = true

func _ready():
	# _animated_sprite.play("idle")
	pass


func _process(delta):
	is_grounded = _ground_raycast.is_colliding()

	if is_grounded:
		is_running = true
		_animated_player.play("run")
	else:
		pass
		_animated_player.play("jump")
		
	
	if Input.is_action_just_pressed("jump") and is_grounded:
		print('Apply impulse!')
		apply_impulse(Vector2(0, -250))
		
func stop_animation():
	# _animated_sprite.stop()
	pass
		
