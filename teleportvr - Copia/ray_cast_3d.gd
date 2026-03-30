extends RayCast3D

func gun_fired() -> void:
	# Forza il raycast ad aggiornarsi immediatamente questo frame
	force_raycast_update()
	
	# Controlla se ha colpito qualcosa
	if not is_colliding():
		return
	
	var hit_target = get_collider()
	
	# Sicurezza extra: verifica che il nodo esista ancora
	if not is_instance_valid(hit_target):
		return
	
	# Controlla il gruppo e chiama damage
	if hit_target.is_in_group("target"):
		hit_target.damage(1.0)
