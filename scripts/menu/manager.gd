extends Node

export(Array,NodePath) var botones_path;
var selec = 0;

var puede_jugar = false;
var puede_salir = false;

func _ready():
	pass


func _process(delta):

	if Input.is_action_just_pressed("atk_esp"):
		if puede_jugar:
			$jugar.accion();
		if puede_salir:
			$salir.accion();

	if Input.is_action_just_pressed("salir"):
		get_tree().quit();


	pass

func _on_area_jugar_mouse_entered():
	puede_jugar = true;
	pass

func _on_area_jugar_mouse_exited():
	puede_jugar = false;
	pass

func _on_area_salir_mouse_entered():
	puede_salir = true;
	pass

func _on_area_salir_mouse_exited():
	puede_salir = false;
	pass

