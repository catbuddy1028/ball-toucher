extends Sprite2D

@export_range(0, 6)
var required_stage: int = 0  # set this per gate in the editor

func _ready():
	check_completed()

func check_completed():
	if Global.game_stage >= required_stage:
		make_visible()
	else:
		make_invisible()

func make_invisible():
	# Example: disable collision and hide the gate so player can pass
	self.visible = false

func make_visible():
	self.visible = true
	# set collision layers/masks back to what they were originally
