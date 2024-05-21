extends Node

onready var save_data = {
		'upgrade' : {
			'nozzle': 0,
			'fire blanket': 0,
			'gear': 0,
			'extinguisher': 0,
			'axe': 0,
			
		},
		'levels' : {
			1: true,
			2: false,
			3: false,
			4: false,
			5: false
		},
		'points' : 100
	} 



onready var new_save_data = {
		'upgrade' : {
			'nozzle': 0,
			'fire blanket': 0,
			'gear': 0,
			'extinguisher': 0,
			'axe': 0,
			
		},
		'levels' : {
			1: true,
			2: false,
			3: false,
			4: false,
			5: false
		},
		'points' : 100
	} 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func save():
	return save_data
	

