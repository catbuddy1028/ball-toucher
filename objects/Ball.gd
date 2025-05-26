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
		if audio_player.playing:
			audio_player.stop()

		var target_pos = get_global_mouse_position() + drag_offset
		var force = (target_pos - global_position) * DRAG_STRENGTH - linear_velocity * DAMPING
		apply_central_force(force)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if dragging:
		return  # don't process collisions while dragging

	var now := Time.get_ticks_msec()

	for i in state.get_contact_count():
		var impact_speed := state.get_contact_local_velocity_at_position(i).length()
		if impact_speed > min_impact_velocity and (now - last_collision_time > IMPACT_COOLDOWN_MS):
			last_collision_time = now

			var t: float = clamp((impact_speed - min_impact_velocity) / (max_impact_velocity - min_impact_velocity), 0.0, 1.0)
			audio_player.volume_db = lerp(base_volume_db, max_volume_db, t)
			audio_player.pitch_scale = 1.0 + randf_range(-pitch_variation, pitch_variation)

			audio_player.play()
			break
