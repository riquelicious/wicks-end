extends Control

export var disabled = true
onready var components = $Control
onready var root_nodes = get_tree().root.get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = File.new()
	if file.file_exists("user://wicks-end-v1.save"):
		print("file exist")
	else:
		components.is_button_disabled(disabled)
	
	pass # Replace with function body.

func initiate():
	for r in root_nodes:
		if r.name == "GameMenu":
			r.to_level()
		pass
	SaveLoadScript.load_game()
	
