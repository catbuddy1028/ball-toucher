extends Area2D

@onready var camera_target = $Marker2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		var camera = get_tree().get_first_node_in_group("main_camera")
		if camera:
			camera.move_to_position(camera_target.global_position)
		else:
			print("Camera not found!")

func _on_body_exited(body):
	if body.is_in_group("player"):
		var camera = get_tree().get_first_node_in_group("main_camera")
		if camera:
			camera.move_to_position(body.global_position)  # <- this is the player
		else:
			print("Camera not found!")
