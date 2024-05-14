extends CanvasLayer

onready var anim = $AnimationPlayer
signal show_finished
signal hide_finished
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func show():
	anim.play_backwards("Hide")
	yield(anim,"animation_finished")
	emit_signal("show_finished")
	
	
func hide():
	anim.play("Hide")
	yield(anim,"animation_finished")
	emit_signal("hide_finished")
	get_tree().call_group("button","reset_bg")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
