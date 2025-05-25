#@icon("res://Assets/Camera2D Area Icon.svg")
class_name DynamicCamera2D extends Node2D

@onready var Camera: Camera2D = $Camera2D
@onready var Area: Area2D = $Area2D
@onready var Collider: CollisionShape2D = $Area2D/CollisionShape2D

var currentZone = null
var cameraZones = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var _areas = Area.get_overlapping_areas()
	if (cameraZones.size() == 0):
		Camera.limit_bottom = 10_000
		Camera.limit_top = -10_000
		Camera.limit_right = 10_000
		Camera.limit_left = -10_000
	else:
		currentZone = cameraZones[cameraZones.size() - 1]
		if (currentZone is CameraZone2D):
			Camera.limit_bottom = currentZone.Zone.global_position.y + currentZone.Zone.shape.extents.y
			Camera.limit_top = currentZone.Zone.global_position.y - currentZone.Zone.shape.extents.y
			Camera.limit_right = currentZone.Zone.global_position.x + currentZone.Zone.shape.extents.x
			Camera.limit_left = currentZone.Zone.global_position.x - currentZone.Zone.shape.extents.x
		else:
			# Not a camera zone so reset camera limits
			Camera.limit_bottom = 10_000
			Camera.limit_top = -10_000
			Camera.limit_right = 10_000
			Camera.limit_left = -10_000
			#return

func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area is CameraZone2D):
		cameraZones.append(area)
		print("CameraZone2D entered: ", area)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if (area is CameraZone2D):
		cameraZones.erase(area)
		print("CameraZone2D exited: ", area)
