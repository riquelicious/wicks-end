extends Control

onready var container = $CenterContainer/VBoxContainer/HBoxContainer
onready var gesture = null
onready var shader = preload("res://Combo/Invert.tres")
onready var combo_array_list = []
onready var index = 0
onready var timer = $ComboTimer
onready var bar = $CenterContainer/VBoxContainer/ProgressBar
var time_length: int
var combo_gesture = {
	0 : "stop",
	1 : "call me",
	2 : "fist",
	3 : "okay",
	4 : "peace",
	5 : "rock",
	6 : "smile",
	7 : "thumbs up",
	8 : "thumbs down"
}

var gesture_image = {
	"stop" : "res://Custom_UI_Module/Gestures/stop.png",
	"call me" : "res://Custom_UI_Module/Gestures/callme.png",
	"fist" : "res://Custom_UI_Module/Gestures/fist.png",
	"okay" : "res://Custom_UI_Module/Gestures/okay.png",
	"peace" : "res://Custom_UI_Module/Gestures/peace.png",
	"rock" : "res://Custom_UI_Module/Gestures/rock.png",
	"smile" : "res://Custom_UI_Module/Gestures/smile.png",
	"thumbs up" : "res://Custom_UI_Module/Gestures/thumbsup.png",
	"thumbs down" : "res://Custom_UI_Module/Gestures/thumbsdown.png"
}

func combo_generator(num):
	var combo_array = []
	var prev_num = null
	time_length = num
	while num > 0: 
		var rand_num = randi() % 8
		if rand_num != prev_num:
			combo_array.append(combo_gesture[rand_num])
			add_image(combo_gesture[rand_num])
			prev_num = rand_num
			num -= 1
	timer.start(time_length)
	return combo_array

func add_image(gest):
	var TRect = TextureRect.new()
	TRect.expand = true
	TRect.rect_min_size = Vector2(80,80)
	container.add_child(TRect)
	TRect.set_texture(load(gesture_image[gest]))
	pass
	
func combo_checking():
	if not combo_array_list.size() > index:
		combo_succeed()
		return
	print(gesture)
	print(combo_array_list[index])
	if gesture == combo_array_list[index]:
		var y = container.get_child(index)
		print(y)
		y.material = ShaderMaterial.new()
		y.material.shader = shader
		index += 1
	pass
 
func _process(_delta: float) -> void:
	if not timer.time_left > 0:
		return
	bar.value = (timer.time_left/time_length) * 100
	if bar. value == 0 and combo_array_list.size() != index:
		print("a")
		game_over()
	pass
	if combo_array_list.size() == index:
		combo_succeed()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed:
			var keycode = event.scancode
			if keycode >= KEY_0 and keycode <= KEY_8:
				var gesture_index = keycode - KEY_0
				if gesture_index >= 0 and gesture_index < combo_gesture.size():
					gesture = combo_gesture[gesture_index]
					combo_checking()
					print(gesture)

func game_over():
	TransitionScene.change_scene("res://Menu/MainMenu.tscn")
					
func combo_succeed():
	timer.stop()
	get_parent().queue_free()

func initiate():
	combo_array_list = combo_generator(5)

func _ready() -> void:
	
	pass # Replace with function body.
