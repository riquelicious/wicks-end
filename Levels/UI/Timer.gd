extends Control

onready var label = $Label
onready var countdown = $Countdown
onready var parent = $".."


signal game_over

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if parent.get_script() != null:
		var p = format_text(countdown.time_left)
		label.text = p
	else:
		#print("Parent Has no Scipt")
		pass 
	input()
"""
for testing
"""
func input():
	$Gauges.is_water_on = Input.is_action_pressed("ui_accept")

	
	if Input.is_action_just_pressed("ui_select"):
		$Gauges.change_health("heal",10)
		



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
