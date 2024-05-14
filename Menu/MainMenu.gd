extends Spatial

onready var mainmenu = $MainMenu
onready var levelselector = $LevelSelector
onready var shop = $UpgradeShop
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func to_level():
	mainmenu.hide()
	yield(mainmenu,"hide_finished")
	levelselector.show()

func to_level2():
	shop.hide()
	yield(shop,"hide_finished")
	levelselector.show()

func to_menu():
	levelselector.hide()
	yield(levelselector,"hide_finished")
	mainmenu.show()
	
func to_shop():
	levelselector.hide()
	yield(levelselector,"hide_finished")
	shop.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
