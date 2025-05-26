extends Node

var hand_open = preload("res://objects/used_assets/hand_open.svg")
var hand_closed = preload("res://objects/used_assets/hand_closed.svg")

func _ready():
	Input.set_custom_mouse_cursor(hand_open, Input.CURSOR_ARROW)

func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		Input.set_custom_mouse_cursor(hand_closed, Input.CURSOR_ARROW)
	else:
		Input.set_custom_mouse_cursor(hand_open, Input.CURSOR_ARROW)
