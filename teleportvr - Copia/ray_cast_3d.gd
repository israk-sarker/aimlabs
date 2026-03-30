extends RayCast3D

# Il TargetDot NON deve essere figlio della pistola.
# Deve essere un nodo MeshInstance3D nella scena ROOT (es. figlio di World/Stanza).
# Trascina quel nodo in questo campo dall'Inspector.
@export var target_dot: MeshInstance3D

@export var max_range: float = 20.0

func _ready() -> void:
	enabled = true

func _process(_delta: float) -> void:
	if target_dot == null:
		return

	force_raycast_update()

	if is_colliding():
		var hit_point: Vector3 = get_collision_point()
		var hit_normal: Vector3 = get_collision_normal()

		# Posiziona il dot nel world space, sul punto di impatto
		target_dot.global_position = hit_point + hit_normal * 0.005
		target_dot.visible = true
	else:
		# Nessuna superficie colpita: proietta il dot a max_range metri avanti
		target_dot.global_position = global_position + (-global_transform.basis.z * max_range)
		target_dot.visible = true

func gun_fired() -> void:
	force_raycast_update()
	var hit_target = get_collider()
	if hit_target != null:
		if hit_target.is_in_group("target"):
			hit_target.damage(1.0)
