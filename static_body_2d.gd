extends StaticBody2D  # or Area2D if you want detection only

@export_range(0, 6)
var required_stage: int = 0  # set this per gate in the editor

func _ready():
	$AnimatedSprite.frame = required_stage
	check_unlock()

func check_unlock():
	if Global.game_stage >= required_stage:
		unlock_gate()
	else:
		lock_gate()

func unlock_gate():
	# Example: disable collision and hide the gate so player can pass
	self.visible = false
	self.set_collision_layer(0)
	self.set_collision_mask(0)

func lock_gate():
	self.visible = true
	# set collision layers/masks back to what they were originally
	self.set_collision_layer(1)
	self.set_collision_mask(1)
