extends RayCast3D

func gun_fired()-> void:
	force_raycast_update()
	var hit_target = get_collider()
	if get_collider() != null:
		if hit_target.is_in_group("target"):
			hit_target.damage(1.0)
