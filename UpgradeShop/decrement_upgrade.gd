extends Control
onready var parent_node = $"../.."

onready var upgradebar = $"../TextureProgress"

func _ready() -> void:
	pass # Replace with function body.

func initiate():
	changeValue()

func changeValue():
	if upgradebar.value > 0:
		Savefile.save_data['points'] += 1
		Savefile.save_data['upgrade'][parent_node.name.to_lower()] -= 1
	upgradebar.value = Savefile.save_data['upgrade'][parent_node.name.to_lower()]
