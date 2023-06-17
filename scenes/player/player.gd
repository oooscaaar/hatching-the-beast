extends CharacterBody2D

const JUMP_VELOCITY = -160.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	$AnimatedPlayer.play("idle")


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		$AnimatedPlayer.play("jump")
	elif not get_parent().is_processing():
		$AnimatedPlayer.play("idle")
	else:
		$AnimatedPlayer.play("run")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
