extends Area2D

@onready var camera_target = $Marker2D

func _on_body_entered(body):
	if body.is_in_group("player"):  # or use name if you prefer
		var cam = body.get_node("Camera2D")  # adjust path if needed
		cam.global_position = camera_target.global_position
