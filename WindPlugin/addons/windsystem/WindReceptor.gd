extends Node2D
class_name WindReceptor

@export var debug:bool = false

var wind:Vector2 = Vector2(0,0)

func _draw():
	if debug:
		draw_line(Vector2(0,0),wind,Color.RED)


func get_blows():
	wind = Vector2(0,0)
	for node in WindSystem.get_turbulences():
		if is_instance_valid(node):
			if node.visible:
				var dist:float = (global_position.distance_to(node.global_position))
				wind += ((global_position-node.global_position)*pow(node.force,2))/pow(dist,2)
	queue_redraw()
	return wind
