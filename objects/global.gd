extends Node
func _ready() -> void:
	
  SilentWolf.configure({
	"api_key": "YhwWYYiFEz9eOKH12Lfx03Y1ywGQNAsX896tNyW8",
	"game_id": "balltoucher",
	"log_level": 1
  })

  SilentWolf.configure_scores({
	"open_scene_on_close": "res://scenes/MainPage.tscn"
  })
