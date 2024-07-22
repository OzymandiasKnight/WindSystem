@tool
extends Node

var turbulences:Array[Turbulence] = []

func _ready():
	turbulences = []

func get_turbulences() -> Array[Turbulence]:
	return turbulences

func add_turbulence(turbulence:Turbulence):
	turbulences.append(turbulence)

func remove_turbulence(turbulence:Turbulence):
	turbulences.erase(turbulence)
