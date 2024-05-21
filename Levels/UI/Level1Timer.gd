extends CanvasLayer

onready var cdTime = Global.level1_time
onready var UI = $UI
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Music.play_music('hurrytfup')
	print(UI.start_timer(cdTime))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
