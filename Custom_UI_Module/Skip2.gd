extends Control

onready var scene = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func initiate():
	scene.back_to_menu()
	pass
