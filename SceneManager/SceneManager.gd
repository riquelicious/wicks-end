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
var position_pic = null
var pos = null
var destination_path = null
var prev_pic = ""
onready var rect = $Control/CenterContainer2/TextureRect
var index = ""
signal wait_done

onready var typing_speed:float = Global.typing_speed
onready var read_time:int = Global.read_time

#index of current message in json
var current_message = 0
#current level of text in json
var current_level = 1
#character index
var current_char = 0

var messages = ""
var message = ""

func _ready() -> void:
	loadJson()
	start_dialogue(Global.play_level, Global.dialogue_position)
	#starts dialogue of current level
	pass # Replace with function body.

#Delay
func wait_to_start():
	var wait = Timer.new()
	wait.one_shot = true
	add_child(wait)
	wait.start(5)
	yield(wait,"timeout")
	emit_signal("wait_done")
	

func loadJson():
	var file = File.new()
	file.open(json_path,file.READ)
	var json = file.get_as_text()
	var result = JSON.parse(json).result
	messages = result
	file.close()



func start_dialogue(level,position):
	position_pic = position
	print("start_dialogue ("+ str(level) + ","+ position +")")
	if str(level).is_valid_integer():
		if (len(levels) > int(level)) and (int(level) > -1):
			current_level = level + 1
			index = "LVL"+str(current_level)
	else:
		print("its not")
		index = level
	if position == "intro":
		pos = "LVLSCRPT"
	elif position == "end":
		pos = "LVLEND"
	changePic(position)
	wait_to_start() 
	yield(self,"wait_done")
	current_message = 0
	current_char = 0
	message = messages[index][pos][str(current_message)]
	textbox.bbcode_text = (message)
	textbox.set_visible_characters(current_char)
	charTimer.set_wait_time(typing_speed)
	charTimer.start()
	

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
	if (current_message == len(messages[index][pos]) - 1):
		var local_index = index.substr(3,3)
		print(local_index, local_index.is_valid_integer())
		if str(local_index).is_valid_integer():
			
			if (len(levels) > int(local_index)) and (int(index) > -1):
				destination_path = levels[int(local_index)-1]
		else:
			Global.is_gameover = true
			destination_path = "res://Menu/MainMenu.tscn"
			pass
		wait_to_start() 
		yield(self,"wait_done")
		TransitionScene.change_scene(destination_path)
		Global.dialogue_position = "intro"
		pass
	else: 
		current_message += 1
		changePic(position_pic)
		message = messages[index][pos][str(current_message)]
		current_char = 0
		textbox.set_visible_characters(current_char)
		textbox.text = message
		charTimer.start()
		
	pass # Replace with function body.

func changePic(position):
	var pic = null
	if position == "intro":
		if prev_pic == pic:
			return
		print(index)
		pic = messages[index]["PICSTART"][str(current_message)]
	elif position == "end":
		if prev_pic == pic:
			return
		pic = messages[index]["PICEND"][str(current_message)]
	prev_pic = pic
	rect.set_texture(load(pic))
	#print(rect.texture)
	
