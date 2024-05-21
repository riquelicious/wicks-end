extends AudioStreamPlayer


onready var audio_bus = load("res://default_env.tres")
onready var tween = $Tween
onready var cur_volume = self.volume_db
var bus_index : int
#Music
onready var musiclib = {
	'candle': load("res://Music/candle.mp3"),
	'hurrytfup' : load("res://Music/HurryTFup.mp3")
}


func _ready() -> void:
	AudioServer.set_bus_layout(audio_bus)
	bus_index = AudioServer.get_bus_index('Music')
	
func play_music(music):
	if self.stream == musiclib[music]:
		return
	self.stream = musiclib[music]
	self.play()
