extends CanvasLayer

onready var anim = $AnimationPlayer

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play_backwards("Fade")
	pass # Replace with function body.

func change_scene(scene_path:String, reset = false):
	anim.play("Fade")
	yield(anim,"animation_finished")
	var _result = get_tree().change_scene(scene_path)
	anim.play_backwards("Fade")
	if reset:
		Global.play_level = 0


func quit():
	anim.play("Fade")
	yield(anim,"animation_finished")
	get_tree().quit()
