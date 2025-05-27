extends StaticBody2D  # or Area2D if you want detection only

var check_timer = 0.0

func _process(delta):
	check_unlock()

func check_unlock():
	if Global.lvl_clear == true:
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
