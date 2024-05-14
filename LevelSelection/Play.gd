extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func initiate():
	TransitionScene.change_scene("res://SceneManager/SceneManager.tscn")
	pass
