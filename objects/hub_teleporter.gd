extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		Global.clear_quiz()
		Global.game_stage += 1
		TransitionScreen.transition_to("res://objects/hub.tscn")
	
