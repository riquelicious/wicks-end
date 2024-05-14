extends Label
onready var parent_node = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = parent_node.name

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
