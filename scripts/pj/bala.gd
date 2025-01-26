extends RigidBody2D

export var fuerza:float;
var puede_disparar;
var dir = Vector2(1,0);

func _ready():
	puede_disparar = true;
	$Sprite.modulate.a = 0;
	pass 

func _process(delta):
	if puede_disparar:
		global_position = get_parent().get_node("player/animaciones").global_position;
		dir = Vector2(0,0);
	else:
		if global_position.distance_to(get_parent().get_node("player/animaciones").global_position) > 900:
			global_position = get_parent().get_node("player/animaciones").global_position;
			puede_disparar = true;
	pass

func disparar(ang):
	$Sprite.modulate.a = 1;
	dir = Vector2(1,0);
	
	if puede_disparar:

		dir = dir.rotated(ang);
		puede_disparar = false;
	else:
		dir = Vector2(0,0);
	pass

func _integrate_forces(state):
	if !puede_disparar:
		state.linear_velocity = Vector2(state.linear_velocity.x + dir.x*fuerza, state.linear_velocity.y + dir.y*fuerza); #Vector2(dir.x*fuerza, dir.y*fuerza);
	#else:
		#state.linear_velocity = Vector2(0,0);
	pass

func _on_Area2D_area_entered(area:Area2D):
	if "ene" in area.get_parent().name:
		#Todos los enemigos tienen que tener esto
		if area.get_parent().has_method("muerto"):
			area.get_parent().muerto();
	pass 
	if area.name != "player":
		puede_disparar = true;
		$Sprite.modulate.a = 0;
	pass # Replace with function body.
