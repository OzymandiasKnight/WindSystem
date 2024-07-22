@tool
extends EditorPlugin

const wind_system_path:String = "res://addons/windsystem/WindSystem.gd"

func _enter_tree():
	add_autoload_singleton("WindSystem",wind_system_path)


func _exit_tree():
	remove_autoload_singleton("WindSystem")
