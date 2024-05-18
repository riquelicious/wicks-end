extends Node

#button
onready var hover_time = 1.5
onready var upgrade_points = 10
onready var for_level = true
onready var play_level = 0 # +1 for current level


#Settings
onready var sfx_volume = 0.0

#Type Speed
onready var read_time = 4
onready var typing_speed = 0.01

#levels

onready var level1_time = 5
onready var level2_time = 5
onready var level3_time = 5
onready var level4_time = 5
onready var level5_time = 5

func _ready() -> void:
	pass # Replace with function body.
