extends Node

export(Array,NodePath) var botones_path;
var selec = 0;

func _ready():
	pass


func _process(delta):

	get_node(botones_path[selec]).get_node("Sprite").hide();

	if Input.is_action_just_pressed("arriba"):
		selec -= 1;
	if Input.is_action_just_pressed("abajo"):
		selec += 1;

	if selec < 0:
		selec = botones_path.size()-1;
	elif selec >= botones_path.size():
		print("Cambio");
		selec = 0;

	get_node(botones_path[selec]).get_node("Sprite").show();

	if Input.is_action_just_pressed("accion"):
		get_node(botones_path[selec]).accion();

	if Input.is_action_just_pressed("salir"):
		get_tree().quit();


	pass
