extends Node

var isfired: bool = false

func _on_right_hand_input_float_changed(name: String, value: float) -> void:
	if name == "trigger" and value > 0.8 and not isfired:
		fire()
func _on_left_hand_input_float_changed(name: String, value: float) -> void:
	if name == "trigger" and value > 0.8 and not isfired:
		fire()
		
func fire():
	isfired = true
	
	$"../light_gun02/AnimationPlayer".play("fire")
	$"../AudioStreamPlayer3D".playing = true
	$"../RayCast3D".gun_fired()
	
	await get_tree().create_timer(0.5).timeout
	isfired = false
