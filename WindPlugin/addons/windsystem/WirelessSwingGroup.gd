@tool
extends WindReceptor
class_name WirelessSwingGroup

##Add your SwingGroups and SwingSprites

@export var nodes:Array[Node2D]:
	set(new_nodes):
		nodes = new_nodes
		for node in new_nodes:
			if node is SwingSprite or node is SwingGroup:
				node.wireless_group = self
