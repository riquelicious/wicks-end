extends Control


onready var upgradebar = $"../TextureProgress"
onready var parent_node = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func initiate():
	changeValue()

func changeValue():
	if Savefile.save_data['points'] > 0:
		if upgradebar.value < 3:
			Savefile.save_data['points'] -= 1
			Savefile.save_data['upgrade'][parent_node.name.to_lower()] += 1
	upgradebar.value = Savefile.save_data['upgrade'][parent_node.name.to_lower()]
	print(Savefile.save_data['upgrade'][parent_node.name.to_lower()])
