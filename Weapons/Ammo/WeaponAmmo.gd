extends Area2D
class_name WeaponAmmo

@export var speed := 25

var direction := Vector2.ZERO
var team := -1

var damage_direct : int
var damage_splash : int
var damage_over_time : int
var status_effect : String
var size : int

var damage = [damage_direct, damage_splash, damage_over_time]

@onready var kill_timer = $KillTimer


func _ready():
	kill_timer.start()


func initalizie(damage, status_effect):
	pass


@warning_ignore("unused_parameter")
func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity


func _on_kill_timer_timeout():
	queue_free()


func _on_body_entered(body : Node2D):
	if body.has_method("handle_hit") and body.has_method("get_team"):
		if body.get_team() != team:
			effect_body(body)
		queue_free()
		


# Methods
func effect_body(body : Node2D):
	body.handle_hit(damage)
	body.handle_effect(status_effect)


func set_direction(user_direction : Vector2):
	self.direction = user_direction
	rotation += direction.angle()
	
