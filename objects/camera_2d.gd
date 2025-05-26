extends Camera2D

# Target position the camera should move to
var target_position: Vector2

# How fast the camera moves toward the target
@export var move_speed: float = 5.0

func _ready():
	# Start at current position
	target_position = global_position

func _process(delta):
	# Smoothly interpolate to the target position
	global_position = global_position.lerp(target_position, move_speed * delta)

func move_to_position(pos: Vector2):
	# Update the target position when entering a new zone
	target_position = pos
