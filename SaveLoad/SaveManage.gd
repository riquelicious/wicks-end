extends CanvasLayer
onready var save_node = $Control/Save
onready var anim = $Control/AnimationPlayer
onready var main = $Control

signal back_to_menu
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	save_node.visible = false
	anim.play_backwards("QueueFree")
	pass # Replace with function body.

func do_signal():
	emit_signal("back_to_menu")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
