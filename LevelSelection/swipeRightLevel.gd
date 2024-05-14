extends Control

onready var description_panel = $"../CanvasLayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func initiate():
	description_panel.compute_destination("add")
	pass
