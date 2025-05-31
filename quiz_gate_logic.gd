extends StaticBody2D

var gate_unlocked = false

func _process(delta):
	check_unlock()
	
func check_unlock():
	if Global.lvl_clear and not gate_unlocked:
		unlock_gate()
	elif not Global.lvl_clear and gate_unlocked:
		lock_gate()


func unlock_gate():
	if not gate_unlocked:
		gate_unlocked = true
		self.set_collision_layer(0)
		self.set_collision_mask(0)
		self.visible = false
func lock_gate():
	gate_unlocked = false
	self.visible = true
	self.set_collision_layer(1)
	self.set_collision_mask(1)
