extends CollisionShape2D


export var vel:float = 10000;
export var fuerza_salto:float = 200;
var estaEnElPiso = false;
var salta = false;

var anim;

var pisoPath:NodePath;
var piso;

var pj;

var actions = [
	"mov_de",
	"mov_iz",
	"salto",
	"atk_esp",
	"atk_gom"
	];

var movx = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pj = get_parent();
	anim = get_parent().get_node("animaciones");
	piso = get_node(pisoPath);
	pass

func _process(delta):
	salta = false;
	movx = (Input.get_action_strength(actions[0]) - Input.get_action_strength(actions[1])) * vel * delta;

	if (Input.is_action_pressed(actions[2]) && estaEnElPiso):
		salta = true;
		$saltar.play();

	if estaEnElPiso:
		if movx == 0:
			pj.cambiarEstadoMovimiento(pj.Estado_Movimiento.IDLE);
		elif movx < 0:
			pj.cambiarEstadoMovimiento(pj.Estado_Movimiento.MOVIZ);
		elif movx > 0:
			pj.cambiarEstadoMovimiento(pj.Estado_Movimiento.MOVDE);
	else:
		pj.cambiarEstadoMovimiento(pj.Estado_Movimiento.SALTA);

	#Procesamos los ataques
	if Input.is_action_just_pressed(actions[3]):
		pj.atacarEspada();
	if Input.is_action_just_pressed(actions[4]):
		pj.atacarGomera();

	pass

func _on_checkeaPiso_body_entered(body:Node):
	if (body.name == "piso"):
		estaEnElPiso = true;
		pass
	pass

func _on_checkeaPiso_body_exited(body:Node):
	if (body.name == "piso"):
		estaEnElPiso = false;
		pass
	pass
