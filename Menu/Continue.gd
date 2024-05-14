extends Control

export var disabled = true
onready var components = $Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	components.is_button_disabled(disabled)
	pass # Replace with function body.

