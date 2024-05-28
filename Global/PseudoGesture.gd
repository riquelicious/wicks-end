extends Node


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("1"):
		Global.gesture = "peace"
	elif Input.is_action_just_pressed("2"):
		Global.gesture = "okay"
	elif Input.is_action_just_pressed("3"):
		Global.gesture = "call me"
	elif Input.is_action_just_pressed("4"):
		Global.gesture = "smile"
	else:
		Global.gesture = "rest"
