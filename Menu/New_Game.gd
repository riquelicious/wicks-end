extends Control

onready var root_nodes = get_tree().root.get_children()


func _ready() -> void:
	pass # Replace with function body.

func initiate():
	for r in root_nodes:
		if r.name == "GameMenu":
			r.to_level()
		pass
	Savefile.save_data = Savefile.new_save_data
