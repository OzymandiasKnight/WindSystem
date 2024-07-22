@tool
extends Sprite2D
class_name SwingSprite

#Exprots
##Rotation Offset in degrees
@export var angle_offset:float = 0.0

@export var weight:float = 100.0

@export var offset_gravity:bool = false
@export var offset_direction:bool = false

const gravity:Vector2 = Vector2(0,-9.8)

var wind:Vector2 = Vector2(0,0)

var wireless_group:WirelessSwingGroup

func _ready():
	pass

func _physics_process(delta):
	var new_angle:float = 0.0
	if get_parent() is SwingSprite:
		new_angle = get_parent().rotation_degrees
	else:
		wind = Vector2(0,0)
		get_blows()
		
		var dir_wind:float = Vector2(0,0).angle_to_point(wind)+(deg_to_rad(angle_offset)*int(offset_direction))
		var dir_gra:float = get_dir_gra()
		
		var a:float = (Vector2(0,0).distance_to(wind)-(weight*0.25))/weight
		
		var lerp:float = clamp(a,0.0,1.0)
		
		new_angle = lerp_angle(dir_gra,dir_wind,lerp)
	
	if is_nan(new_angle):
		new_angle = get_dir_gra()
	
	rotation = lerp_angle(rotation,new_angle,0.25)

func get_dir_gra() -> float:
	return Vector2(0,0).angle_to_point(gravity)+(deg_to_rad(angle_offset)*int(offset_gravity))
	

func get_blows():
	if wireless_group:
		wind = wireless_group.get_blows()
	elif get_parent() is SwingGroup:
		wind = get_parent().get_blows()

