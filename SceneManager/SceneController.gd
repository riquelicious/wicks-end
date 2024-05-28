extends Control

# Load JSON data
var script_data = {}
var current_index = 0
var choices_data = {}
onready var choices = $Choices
onready var anim = $"../AnimationPlayer"
onready var timer = $"../Timer"
var level = null
var dialogue_position = null
var choices_visible = false
var time = 3
onready var destination = Global.sceneDestination
func _ready(): 
	choices.modulate.a = 0
	$Panel.modulate.a = 0
	var file = File.new()
	if file.file_exists("res://scriptV2.json"):
		file.open("res://scriptV2.json", File.READ)
		var json = file.get_as_text()
		var result = JSON.parse(json).result
		script_data = result
		file.close()
		change_dialogue_content("END")
	else:
		print("JSON file not found.")

func change_dialogue_content(pos):
	
	dialogue_position = pos
	level = "LVL" + str(Global.play_level + 1)
	if script_data[level][pos].has(str(current_index)):
		anim.play("Fade2")
		var content = script_data[level][pos].get(str(current_index), "")
		$Panel/CenterContainer/Subtitles.text = content
	if script_data[level]["Pictures"].has(str(current_index)):
		var image =  script_data[level]["Pictures"][(str(current_index))]
		$"../TextureRect".texture = load(image)
	check_for_choices()
	if current_index < len(script_data[level][pos]):
		current_index += 1
		timer.start(time)
	else:
		TheChosenOne()


func check_for_choices():
	choices_data = script_data[level]["CHOICES" + dialogue_position].get(str(current_index), {})
	if choices_data.size() > 0:
		print("Choices available:")
		show_buttons()
		timer.paused = true

func show_buttons():
	choices_visible = true
	yield(anim,"animation_finished")
	anim.play("Fade")
	var i = 0
	for choice in choices.get_children():
		choice.visible = false
	for key in choices_data.keys():
		if not choices.get_child(i).name == "ColorRect2":
			for child in  choices.get_child(i).get_child(0).get_children():
				if child.name == "Label":
					child.text = choices_data[key][0]  # Set button text from choices data
		choices.get_child(i).visible = true
		i += 1

func hide_all_buttons():
	choices_visible = false
	anim.play_backwards("Fade")
		
func on_button_pressed(button_index):
	print("Button pressed: " + str(button_index))
	var message_choice = str(button_index)
	if message_choice in choices_data:
		print(current_index)
		#var choice_text = script_data["LVL1"]["CHOICES"][str(current_index)].get(str(button_index), "")
		var choice_text = choices_data[str(button_index)][1]
		print(choice_text)
		anim.play("Fade2")
		$Panel/CenterContainer/Subtitles.text = choice_text
		hide_all_buttons()
		timer.start(time)
		timer.paused = false
	else:
		print("Invalid choice index: " + str(button_index))

func _process(_delta: float) -> void:
	if not choices_visible:
		return
	if Global.gesture == "peace":
		on_button_pressed(0)
	elif Global.gesture == "okay":
		on_button_pressed(1)
	elif Global.gesture == "call me":
		on_button_pressed(2)
	elif Global.gesture == "smile":
		on_button_pressed(3)
	

func TheChosenOne():
	TransitionScene.change_scene(destination)
	pass


func _on_Timer_timeout() -> void:
	change_dialogue_content(dialogue_position)
