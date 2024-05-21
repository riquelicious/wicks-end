extends Control
onready var parent_node = $"../../../../../.."
onready var anim = $"../../../../../AnimationPlayer"
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func initiate():
	anim.play("QueueFree")
	yield(anim,"animation_finished")
	#parent_node.do_signal()
	parent_node.queue_free()
	
