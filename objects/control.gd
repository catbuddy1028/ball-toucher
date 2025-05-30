extends Control

const PASSWORD = "open_sesame"

func _ready():
	$LineEdit.connect("text_submitted", Callable(self, "_on_text_entered"))
	$Button.connect("pressed", Callable(self, "_on_button_pressed"))

func _on_text_entered(text: String) -> void:
	_check_password(text)

func _on_button_pressed() -> void:
	_check_password($LineEdit.text)

func _check_password(text: String) -> void:
	if text == PASSWORD:
		get_tree().change_scene_to_file("res://lvl_5.tscn")
	else:
		$LineEdit.clear()
		$LineEdit.placeholder_text = "Try again"
