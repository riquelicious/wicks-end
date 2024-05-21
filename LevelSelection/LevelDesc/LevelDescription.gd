extends PanelContainer


onready var current_index:int = 0
onready var next_index:int = 1
onready var anim:AnimationPlayer = $AnimationPlayer
onready var anim_array:Array =[
	"5>1",
	"1>2",
	"2>3",
	"3>4",
	"4>5"
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.play_level = 0
	pass # Replace with function body.

func compute_destination(operation):
	if operation == "add":
		next_index = (current_index + 1) % 5
		anim.play(anim_array[next_index])
		current_index = next_index	
		pass
	elif operation == "sub":
		next_index = int(fposmod(current_index-1,5))
		anim.play_backwards(anim_array[current_index])
		current_index = next_index	
		pass
	else: 
		print("invalid operation")
	Global.play_level = current_index
	print(current_index)
	
	
	
func update_animation():
	pass
