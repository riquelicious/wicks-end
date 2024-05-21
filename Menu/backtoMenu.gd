extends Control

onready var root_nodes = get_tree().root.get_children()
var menu = null
func _ready() -> void:
	pass # Replace with function body.

func initiate():
	
	for r in root_nodes:
		if r.name == "GameMenu":
			menu = r
			var save_window = load("res://SaveLoad/SaveManage.tscn").instance()
			r.add_child(save_window)
			save_window.connect("back_to_menu",self,"_on_back_to_menu")
			
			
		pass

func _on_back_to_menu():
	print("signal")
	menu.to_menu()
	pass
