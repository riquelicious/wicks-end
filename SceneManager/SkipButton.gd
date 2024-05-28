extends Control

onready var scene = $"../SceneController"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func initiate():
	scene.TheChosenOne()
	pass
