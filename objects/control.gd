extends Control

const PASSWORD = "byte"

func _ready():
	$LineEdit.connect("text_submitted", Callable(self, "_on_text_entered"))
	$Button.connect("pressed", Callable(self, "_on_button_pressed"))

func _on_text_entered(text: String):
	_check_password(text)

func _on_button_pressed():
	_check_password($LineEdit.text)

func _check_password(text: String):
	if text == PASSWORD:
		TransitionScreen.transition_to("res://objects/lvl_5.tscn")
	else:
		$LineEdit.clear()
		$LineEdit.placeholder_text = "skus znovu!"
