extends Node2D

@export_range(0, 6)
var required_stage: int = 0  # set this per gate in the editor

func _ready():
	check_unlock()

func check_unlock():
	if Global.game_stage >= required_stage:
		tutorial_hide()
	else:
		tutorial_unhide()

func tutorial_hide():
	self.visible = false


func tutorial_unhide():
	self.visible = true
