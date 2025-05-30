extends Node

var game_stage = 0

var quiz1_result = 0
var quiz2_result = 0
var quiz3_result = 0

var check_timer := 0.0

var lvl_clear = false

func _ready() -> void:
	pass


func _process(delta):
	check_timer += delta
	if check_timer >= 1.0:
		check_timer == 0.0
		if (quiz1_result + quiz2_result + quiz3_result) >= 3:
			lvl_clear = true
	
func clear_quiz():
	quiz1_result = 0
	quiz2_result = 0
	quiz3_result = 0
	lvl_clear = false
	
func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_F11:
		JavaScriptBridge.eval("document.getElementById('canvas').requestFullscreen();")
