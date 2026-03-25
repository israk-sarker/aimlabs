extends StaticBody3D


@onready var mesh = $MeshInstance3D
@onready var audio = $AudioStreamPlayer3D

func damage(amount: float) -> void:
	mesh.get_surface_override_material(0).albedo_color = Color.RED
	audio.playing = true
	await get_tree().create_timer(.5).timeout
	mesh.get_surface_override_material(0).albedo_color = Color.CYAN
	print(amount)
