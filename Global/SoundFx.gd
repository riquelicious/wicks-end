extends AudioStreamPlayer

#UI soundsfx
onready var sfxlib = {
	'hover' : preload("res://SFX/Minimalist7.wav"),
	'confirm' : preload("res://SFX/selection-selected.wav"),
	'typing' : preload("res://SFX/type1.wav"),
	'dash' : preload("res://SFX/space1.wav")
}


func _ready() -> void:
	AudioServer.set_bus_layout(load("res://default_env.tres"))
	
func hover_sound():
	self.stream = sfxlib['hover']
	self.play()

func confirm_sound():
	self.stream = sfxlib['confirm']
	self.play()

func type_sound():
	self.stream = sfxlib['typing']
	self.play()
	
	
func type_space_sound():
	self.stream = sfxlib['dash']
	self.play()

