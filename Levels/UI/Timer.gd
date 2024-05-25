extends Control

onready var label = $CenterContainer/Label
onready var countdown = $Countdown
onready var parent = $".."


signal game_over

func _ready() -> void:
	pass

func level_finished():
	Global.is_gameover = true
	Global.dialogue_position = "end"
	Global.back_to_menu = true
	TransitionScene.change_scene("res://SceneManager/SceneManager.tscn")
	

func _process(_delta: float) -> void:
	if parent.get_script() != null:
		var p = format_text(countdown.time_left)
		label.text = p
	else:
		pass 
	
"""
for testing
"""
func _input(event: InputEvent) -> void:
	$Gauges.is_water_on = Input.is_action_pressed("ui_accept")
	if Input.is_action_just_pressed("ui_cancel"):
		$Gauges.change_health("damage",5)
	
	
		



func format_text(cd):
	var minutes = cd/60
	var seconds = fmod(cd,60)
	var milliseconds = fmod(cd,1) * 100
	var text = "%02d:%02d:%02d" % [minutes,seconds,milliseconds]
	return str(text)


func start_timer(n):
	countdown.start(n)
	pass
	


func _on_Countdown_timeout() -> void:
	emit_signal("game_over")
	Global.play_level = "gameover" #game over?
	TransitionScene.change_scene("res://SceneManager/SceneManager.tscn")
