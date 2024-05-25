extends ParallaxBackground


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("span_camera")


func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	$ComboUI.visible = true
	$ComboUI.initiate()
	pass # Replace with function body.
