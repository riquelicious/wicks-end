extends Control

#Reference
onready var animation_player_bg = $AnimationPlayer
onready var background = $"../ColorRect"
onready var parent_node = $".."
onready var label = $Label

#Button Settings
onready var repeat = true
onready var disabled = false
#Preload
var loader_pack = preload("res://Custom_UI_Module/Loader.tscn")
var loader


func _ready() -> void:
	#change label text into scene name
	label.text = parent_node.name

func is_button_disabled(state = false):
	#checks if button is disabled
	disabled = state
	if disabled == true:
		label.modulate = Color(0.45,0.45,0.45)
	else: 
		label.modulate = Color(1,1,1)


func _on_Control_mouse_entered() -> void:
	if disabled:
		return

	#resets value to true
	repeat = true
	while repeat:

		#hover animation
		animation_player_bg.play("shade_in")
		SoundFx.hover_sound()

		#shows circular progressbar
		loader = loader_pack.instance()
		get_tree().root.add_child(loader)
		loader.start()
		yield(loader,"loading_done")

		#confirms when loading finishes
		SoundFx.confirm_sound()

		#run "initiate" function on parent node
		if parent_node.get_script() != null:
			parent_node.initiate()
		else:
			print("Parent Has no Scipt")
		pass 


func _on_Control_mouse_exited() -> void:
	animation_player_bg.play("shade_out")
	repeat = false
	if is_instance_valid(loader):
		loader.queue_free()

func reset_bg():
	animation_player_bg.play("shade_out")

