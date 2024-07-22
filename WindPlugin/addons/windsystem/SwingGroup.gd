@tool
extends WindReceptor
class_name SwingGroup

var wireless_group:WirelessSwingGroup

func get_blows():
	if wireless_group:
		wind = wireless_group.get_blows()
		queue_redraw()
		return wind
	else:
		wind = super()
		return wind
