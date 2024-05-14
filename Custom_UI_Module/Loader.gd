extends CenterContainer

signal loading_done

onready var loader = $TextureProgress
var timer: Timer

func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	if timer != null:
		loader.value = 12 - int(timer.time_left/(Global.hover_time/12))
	pass
		
func start():
	timer = Timer.new()
	timer.one_shot = true
	add_child(timer)
	timer.start(Global.hover_time)
	yield(timer, "timeout")
	emit_signal("loading_done")
	queue_free()
	

