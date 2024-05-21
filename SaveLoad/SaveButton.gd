extends Control
onready var anim = $"../../../../../AnimationPlayer"
onready var parent_node = $"../../../../../.."
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func initiate():
	anim.play("QueueFree")
	yield(anim,"animation_finished")
	SaveLoadScript.save_game()
	parent_node.do_signal()
	parent_node.queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
