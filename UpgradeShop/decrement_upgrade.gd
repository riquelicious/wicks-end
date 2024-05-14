extends Control


onready var upgradebar = $"../TextureProgress"

func _ready() -> void:
	pass # Replace with function body.

func initiate():
	changeValue()

func changeValue():
	if upgradebar.value > 0:
		Global.upgrade_points += 1
		upgradebar.value -= 1
