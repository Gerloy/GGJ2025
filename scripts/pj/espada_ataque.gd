extends Area2D

var time;
export var atk_time:float;

var lado:String = "de";


func _ready():
	time = 0;
	pass

#TODO fijarse que active el lado de la espada al que esta mirando el mouse
func _process(delta):
	time += delta;
	if time >= atk_time:
		time = 0;
		var parent = get_parent();
		parent.cambiarEstadoAtk(parent.Estado_Ataque.NO);
		var name = "hitbox_"+lado;
		get_node(name).disabled = true;
		get_node(name).hide();
		hide();
	pass


func _on_espada_area_entered(area:Area2D):
	#print(area.get_parent().name);
	if "ene" in area.name:
		#Todos los enemigos tienen que tener esto
		if area.has_method("muerto"):
			area.muerto();
	elif "ene" in area.get_parent().name:
		#Todos los enemigos tienen que tener esto
		if area.get_parent().has_method("muerto"):
			area.get_parent().muerto();
	pass 
