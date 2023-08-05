extends CharacterBody2D
class_name Player

signal died


@export var speed := 300

var scale_ammo : int = 1
var max_ammo : int = 10


@onready var team = $Team
@onready var weapon : WeaponGun = $WeaponGun
@onready var health_pool = $Health
@onready var camera_transform = $CameraTransform


func _ready():
	weapon.initialize(team.team_name, scale_ammo, max_ammo)


@warning_ignore("unused_parameter")
func _physics_process(delta):
	var movement_direction := Vector2.ZERO
	movement_direction = Input.get_vector("left", "right", "up", "down")
	
	movement_direction = movement_direction.normalized()
	velocity = movement_direction * speed
	
	move_and_slide()
	look_at(get_global_mouse_position())


func _unhandled_input(event):
	if event.is_action_released("shoot"):
		weapon.shoot()
	
	elif event.is_action_released("reload"):
		weapon.reload()
		

func set_camera_transform(camera_path):
	camera_transform.remote_path = camera_path


# Methods
func reload():
	weapon.reload()

func get_team() -> int:
	return team.team_name

func handle_hit(damage):
	health_pool.current_health -= damage
	if health_pool.current_health <= 0:
		die()

func die():
	emit_signal("died")
	queue_free()
	
