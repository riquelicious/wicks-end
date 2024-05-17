extends PanelContainer

onready var nozzle = $Nozzle
onready var axe = $Axe
onready var extinguisher = $Extinguisher


func _ready() -> void:
	nozzle.visible = true
	axe.visible = false
	extinguisher.visible = false
	pass # Replace with function body.


func make_visible(equipment):
	nozzle.visible = false
	axe.visible = false
	extinguisher.visible = false
	if equipment == "nozzle":
		nozzle.visible = true
		return
	if equipment == "axe":
		axe.visible = true
		return
	if equipment == "extinguisher":
		extinguisher.visible = true
		return
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
