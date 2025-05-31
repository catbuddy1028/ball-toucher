extends RigidBody2D

const  lines: Array[String] = [
	"drž [img=center,center]objects/used_assets/mouse_left.png[/img] pro chycení koule"
]

# Dragging behavior
var dragging := false
var drag_offset := Vector2.ZERO
const DRAG_STRENGTH := 1200.0
const DAMPING := 80.0

# Impact sound control
var last_collision_time := 0
const IMPACT_COOLDOWN_MS := 100

@export var min_impact_velocity := 100.0
@export var max_impact_velocity := 1000.0
@export var base_volume_db := -10.0
@export var max_volume_db := 0.0
@export var pitch_variation := 0.15

@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready():
	contact_monitor = true
	max_contacts_reported = 5

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and get_global_mouse_position().distance_to(global_position) < 50:
			dragging = true
			drag_offset = global_position - get_global_mouse_position()
		elif not event.pressed:
			dragging = false

func _physics_process(delta):
	if dragging:
		var target_pos = get_global_mouse_position() + drag_offset
		var force = (target_pos - global_position) * DRAG_STRENGTH - linear_velocity * DAMPING
		apply_central_force(force)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if dragging:
		return  # don't process collisions while dragging
