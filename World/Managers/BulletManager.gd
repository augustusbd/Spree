extends Node2D


func handle_bullet_spawned(bullet: WeaponAmmo, team: int, bullet_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.team = team
	bullet.global_position = bullet_position
	bullet.set_direction(direction)
