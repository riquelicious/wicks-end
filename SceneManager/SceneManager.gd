extends CanvasLayer

onready var textbox:RichTextLabel = $Control/CenterContainer/RichTextLabel
onready var json_path = "res://script.json"
onready var charTimer:Timer = $Control/charTimer
onready var Delay:Timer = $Control/DialogueDelay
onready var levels = [
	"res://Levels/Level1/Level1.tscn",
	"res://Levels/Level2/Level2.tscn",
	"res://Levels/Level3/Level3.tscn",
	"res://Levels/Level4/Level4.tscn",
	"res://Levels/Level5/Level5.tscn"
]

export var typing_speed:float = 0.01
export var read_time:int = 4

var current_message = 0
var current_level = 1
var messages = ""
var display = ""
var current_char = 0
var message = ""
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadJson()
	wait_to_start() #starts dialogue of current level
	pass # Replace with function body.

func wait_to_start():
	var wait = Timer.new()
	wait.one_shot = true
	add_child(wait)
	wait.start(3)
	yield(wait,"timeout")
	start_dialogue(Global.play_level)

#Load Script.json then put it in var messages
func loadJson():
	var file = File.new()
	file.open(json_path,file.READ)
	var json = file.get_as_text()
	var result = JSON.parse(json).result
	messages = result
	file.close()
	
func start_dialogue(level):
	current_level = level + 1
	current_message = 0
	current_char = 0
	message = messages["LVL"+str(current_level)]["LVLSCRPT"][str(current_message)]
	textbox.bbcode_text = (message)
	textbox.set_visible_characters(current_char)
	charTimer.set_wait_time(typing_speed)
	charTimer.start()
	
func get_dialogue():
	
	pass


func _on_charTimer_timeout() -> void:
	if (current_char < len(message)):
		current_char += 1
		textbox.set_visible_characters(current_char)	
		GlobalSound.type_sound()
	else:
		GlobalSound.type_space_sound()
		charTimer.stop()
		Delay.set_wait_time(read_time)
		Delay.start()
		pass


func _on_DialogueDelay_timeout() -> void:
	if (current_message == len(messages["LVL"+str(current_level)]["LVLSCRPT"]) - 1):
		TransitionScene.change_scene(levels[Global.play_level])
		#emit_signal("scene_finished")
		#stop_dialogue()
		pass
	else: 
		current_message += 1
		message = messages["LVL"+str(current_level)]["LVLSCRPT"][str(current_message)]
		textbox.text = message
		current_char = 0
		charTimer.start()
	pass # Replace with function body.
