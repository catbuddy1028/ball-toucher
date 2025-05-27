extends Area2D

func _on_body_entered(body):
	if body.is_in_group("quiz_object"):
		Global.quiz1_result = 1

func _on_body_exited(body):
	if body.is_in_group("quiz_object"):
		Global.quiz1_result = 0
