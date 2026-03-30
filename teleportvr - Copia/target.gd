extends StaticBody3D

@onready var mesh: MeshInstance3D = $MeshInstance3D
@onready var audio: AudioStreamPlayer3D = $AudioStreamPlayer3D

var _is_hit: bool = false  # evita che colpi multipli sovrappongano gli await

func damage(amount: float) -> void:
	if _is_hit:
		return
	_is_hit = true
	
	# Crea una copia del materiale per non modificare quello condiviso
	var mat = mesh.get_surface_override_material(0).duplicate()
	mesh.set_surface_override_material(0, mat)
	
	mat.albedo_color = Color.RED
	audio.play()
	
	await get_tree().create_timer(0.5).timeout
	
	mat.albedo_color = Color.CYAN
	_is_hit = false
