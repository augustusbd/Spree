extends Node2D



@export var max_health = 300
@export var current_health = 100:
	get:
		return current_health
	set(new_health):
		current_health = clamp(new_health, 0, max_health)


func _set_health(new_health : int):
	current_health = clamp(new_health, 0 , max_health)
