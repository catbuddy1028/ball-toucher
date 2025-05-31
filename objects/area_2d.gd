extends Area2D

@export var next_scene_path: String

func _on_body_entered(body):
	if body.is_in_group("player"):
		TransitionScreen.transition_to(next_scene_path)
