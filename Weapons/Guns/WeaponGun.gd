extends Node2D
class_name WeaponGun

signal out_of_ammo

@export var Ammo : PackedScene

var team := -1
var max_ammo : int
var current_ammo : int
var scale_ammo : int


@onready var gun_end = $GunEnd
@onready var gun_direction = $GunDirection
@onready var cooldown = $Cooldown
#@onready var animation_player = $AnimationPlayer
#@onready var muzzle_flash = $MuzzleFlash


func _ready():
	pass

func initialize(team : int, scale_ammo: int, max_ammo: int):
	self.team = team
	self.scale_ammo = scale_ammo
	self.max_ammo = max_ammo
	current_ammo = max_ammo
	
	

func initialize_ammo(scale_ammo: int):
	pass




# Methods
func shoot():
	if current_ammo != 0 and cooldown.is_stopped() and Ammo != null:
		var bullet_instance = Ammo.instantiate()
		var direction = (gun_direction.global_position - gun_end.global_position).normalized()
		GlobalSignals.bullet_fired.emit(bullet_instance, team, gun_end.global_position, direction)
		cooldown.start()
		# player gun animation
		
		current_ammo -= 1
		if current_ammo == 0:
			emit_signal("out_of_ammo")
		

func reload():
	# animation player > reload animation
	current_ammo = max_ammo

func _stop_reload():
	# this is called at the end of reload animation
	pass




func select_ammo(ammo: PackedScene):
	pass

func aim():
	# right-click 
	# add line of sight to mouse pointer
	pass

