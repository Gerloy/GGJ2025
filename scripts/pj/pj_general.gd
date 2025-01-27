extends RigidBody2D

enum Estado_Movimiento{
	IDLE,
	MOVIZ,
	MOVDE,
	SALTA
}
var estado_mov;

enum Estado_Ataque{
	NO,
	ESPADA,
	GOMERA,
}
var estado_atk;
export var atk_offset:float;
var atk_time;

#export var piso:

export var pisoPath:NodePath;
export var drimitrescu:String;

var mov;
var ani;
var espada;
#var gomera;
var puede_atacar;


# Called when the node enters the scene tree for the first time.
func _ready():
	estado_atk = Estado_Ataque.NO;
	estado_mov = Estado_Movimiento.IDLE;
	mov = $hitbox;
	ani = $animaciones;
	espada = $espada; 
	#gomera = $gomera;
	puede_atacar = true;
	atk_time = 0;
	mov.pisoPath=pisoPath;
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	#puede_atacar = false;
	if estado_atk == Estado_Ataque.NO:
		atk_time += delta; 
		if atk_time >= delta:
			puede_atacar = true;

	pass

func _integrate_forces(state):
	rotation_degrees = 0;
	state.linear_velocity.x = mov.movx;
	state.linear_velocity.y -= mov.fuerza_salto if mov.salta else 0;
	pass


func cambiarEstadoMovimiento(e):
	estado_mov = e;
	pass

func cambiarEstadoAtk(e):
	estado_atk = e;
	pass

func atacarEspada():
	if estado_atk == Estado_Ataque.NO && puede_atacar:
		atk_time = 0; 
		estado_atk = Estado_Ataque.ESPADA;
		$espada/espadita.play();
		var lado;
		if get_parent().get_global_mouse_position().x >= global_position.x:
			lado = "de";
		else:
			lado = "iz";

		espada.lado = lado;
		var name = "hitbox_" + lado;
		espada.get_node(name).show();
		espada.get_node(name).disabled = false;
		espada.show();
		puede_atacar = false;

	pass

func atacarGomera():
	if estado_atk == Estado_Ataque.NO && puede_atacar:
		atk_time = 0; 
		estado_atk = Estado_Ataque.GOMERA;
		#gomera.show();
		#gomera.visible = true;
		#gomera.modulate.a = 1;
		puede_atacar = false;

	pass

##TODO llenar la funcion esta cuando sepamos como es el tema de la vida
func restarVida():
	print("Cago el pibe");
	pass

#DIMITRESCU

func _on_AREA_area_entered(area):
	if area.get_parent().name == "player":
		print("Entro")
		_muerte(false)

func _on_AREA_area_exited(area):
	if area.get_parent().name == "player":
		print("Salio")
		_muerte(true)

func _muerte(estado: bool):
	if estado:
		print("Muerte activada");
		$dimitrescu.show();
		$dimitrescu/Light2D.show();
		$dimitrescu/AnimatedSprite.play("atacando");
		_iniciar_timer(10);
	else:
		print("Muerte desactivada");
		$dimitrescu/AnimatedSprite.play("idle");
		$dimitrescu/Light2D.hide();
		$Timer.stop();
		
func _iniciar_timer(segundos: float):
	$Timer.wait_time = segundos
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene(drimitrescu);
	print("drimitescu te atrapo") 
