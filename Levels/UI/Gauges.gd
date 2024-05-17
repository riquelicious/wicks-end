extends Control

onready var healthbar = $Health
onready var waterbar = $Water
onready var tween = $Tween
onready var nTween = $tweenNozzleUp
onready var nTween1 = $tweenNozzleDown
onready var timer = $tweenWait
var increment = 1
var water_value = 0
var is_water_on = false
var water_decrease_value = 0.3
var water_increase_value = 0.2

func _ready() -> void:
	pass 

func change_health(effect,value):
	var x = 0
	if effect == "damage":
		if value < healthbar.value:
			x = healthbar.value - value
			tween.interpolate_property(healthbar,"value",healthbar.value,x,0.3,tween.TRANS_CUBIC,tween.EASE_IN_OUT)
			tween.start()
			pass
	if effect == "heal":
		x = healthbar.value + value
		tween.interpolate_property(healthbar,"value",healthbar.value,x,0.3,tween.TRANS_CUBIC,tween.EASE_IN_OUT)
		tween.start()

func water_guage(is_on=false):
	is_water_on = is_on
	#when on
	#decrese
	#faster
	if is_water_on:
		if water_value > 0:
			water_value -= water_decrease_value
		pass
	
	#when off
	#increase
	#slower
	if !is_water_on:
		if (water_value <= 0) and (timer.is_stopped()) :
			timer.start(1)

		elif (water_value != 0) and (timer.time_left == 0):
			if water_value < 100:
				water_value += water_increase_value
		pass
	waterbar.value = water_value
	pass

func _process(_delta: float) -> void:
	water_guage(is_water_on)
	#print(timer.time_left)
	pass


func _on_tweenWait_timeout() -> void:
	timer.stop()
	water_value +=0.1
	
	pass # Replace with function body.
