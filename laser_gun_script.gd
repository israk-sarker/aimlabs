extends Node

var isfired: bool = false



func _on_laser_gun_action_pressed(pickable: Variant) -> void:
		if isfired == false:
			isfired = true
			$"../light_gun02/AnimationPlayer".play("fire")
			$"../AudioStreamPlayer3D".playing = true
			$"../RayCast3D".gun_fired()
			await get_tree().create_timer(.5).timeout
			isfired = false
