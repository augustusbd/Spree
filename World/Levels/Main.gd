extends Node2D


const Player = preload("res://Actors/Player/Player.tscn")

@onready var bullet_manager = $BulletManager
@onready var camera = $Camera2D
@onready var respawn_timer = $RespawnTimer

func _ready():
	randomize()
	GlobalSignals.connect("bullet_fired", bullet_manager.handle_bullet_spawned)
	
	spawn_player()

func spawn_player():
	var player = Player.instantiate()
	add_child(player)
	player.set_camera_transform(camera.get_path())
	player.connect("died", respawn_player)


func respawn_player():
	respawn_timer.start()


func _on_respawn_timer_timeout():
	spawn_player()
