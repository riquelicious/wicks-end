extends Control


onready var upgradebar = $"../TextureProgress"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func initiate():
	changeValue()

func changeValue():
	if Global.upgrade_points > 0:
		if upgradebar.value < 3:
			Global.upgrade_points -= 1
			upgradebar.value += 1
