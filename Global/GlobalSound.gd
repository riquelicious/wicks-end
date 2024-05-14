extends AudioStreamPlayer

#UI soundsfx
onready var hoversfx = preload("res://SFX/Minimalist7.wav")
onready var confirmsfx = preload("res://SFX/selection-selected.wav")

#SceneManager soundfx
onready var type1 = preload("res://SFX/type1.wav")
onready var type2 = preload("res://SFX/type2.wav")
onready var space1 = preload("res://SFX/space1.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#hover_sound()
	pass
	
func hover_sound():
	volume_db = volume_control()
	if self.is_playing():
		#self.stop()
		pass
	self.stream = hoversfx
	self.play()

func confirm_sound():
	volume_db = volume_control()
	if self.is_playing():
		#self.stop()
		pass
	self.stream = confirmsfx
	self.play()

func type_sound():
	volume_db = volume_control() - 5
	#var sound = randi() % 2
	if self.is_playing():
		#self.stop()
		pass
	#if sound == 0:
	self.stream = type1
	#elif sound == 1:
	#	self.stream = type2
	self.play()
	
	
func type_space_sound():
	volume_db = volume_control() - 5
	
	if self.is_playing():
		#self.stop()
		pass
	self.stream = space1
	self.play()
	#yield(self,"finished")
	#emit_signal("finished_sound")
	pass
	
func volume_control():
	return Global.sfx_volume
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
