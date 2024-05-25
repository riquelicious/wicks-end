extends Control

onready var healthbar = $Healthbar
onready var waterbar = $Waterbar
onready var tween = $Tween
onready var nTween = $tweenNozzleUp
onready var nTween1 = $tweenNozzleDown
onready var timer = $tweenWait
onready var healthLabel = $Control/HBoxContainer/HealthRemaining
var increment = 1
var water_value = 100
var extinguisher_value = 100
var is_water_on = false
var is_extinguisher_on = false
var water_decrease_value = 0.5
var water_increase_value = 0.2
var sub = "nozzle"
signal damage_done
onready var x = 100
func _ready() -> void:
	pass 

func change_health(effect,value):
	
	if effect == "damage":
		#if value < healthbar.value:
		x -= value
		tween.interpolate_property(healthbar,"value",healthbar.value,x,0.3,tween.TRANS_CUBIC,tween.EASE_IN_OUT)
		tween.start()
		pass
	if effect == "heal":
		x += value
		tween.interpolate_property(healthbar,"value",healthbar.value,x,0.3,tween.TRANS_CUBIC,tween.EASE_IN_OUT)
		tween.start()
	emit_signal("damage_done")
func change_extunguisher(is_on=false):
	is_extinguisher_on = is_on
	if is_extinguisher_on:
		if extinguisher_value > 0:
			extinguisher_value -= water_decrease_value
		pass
	
func water_guage(is_on=false):
	is_water_on = is_on
	if is_water_on:
		if water_value > 0:
			water_value -= water_decrease_value
		pass
	if !is_water_on:
		if (water_value <= 0) and (timer.is_stopped()) :
			timer.start(0.5)
		elif (water_value != 0) and (timer.time_left == 0):
			if water_value < 100:
				water_value += water_increase_value

func _physics_process(delta: float) -> void:
	water_guage(is_water_on)
	print(timer.time_left)
	print(water_value)
	healthLabel.text = str(floor(healthbar.value))
	if sub == "nozzle":
		waterbar.value = water_value
	elif sub == "extinguisher":
		waterbar.value = extinguisher_value
	pass


func _on_tweenWait_timeout() -> void:
	timer.stop()
	water_value +=0.1
