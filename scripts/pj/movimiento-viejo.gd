extends RigidBody2D

export var vel:float = 10000;
export var fuerza_salto:float = 200;
var estaEnElPiso = false;
var salta = false;

var anim;

export var pisoPath:NodePath;
var piso;

var actions = [
	"mov_de",
	"mov_iz",
	"salto"
	];

var movx = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = get_parent().get_node("Sprite");#$Sprite;
	piso = get_node(pisoPath);
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	salta = false;
	movx = (Input.get_action_strength(actions[0]) - Input.get_action_strength(actions[1])) * vel * delta;

	if (Input.is_action_pressed(actions[2]) && estaEnElPiso):
		salta = true;

	if estaEnElPiso:
		if movx == 0:
			anim.cambiarEstado(anim.Estado.IDLE);
		elif movx < 0:
			anim.cambiarEstado(anim.Estado.MOVIZ);
		elif movx > 0:
			anim.cambiarEstado(anim.Estado.MOVDE);
	else:
		anim.cambiarEstado(anim.Estado.SALTA);


	pass

func _integrate_forces(state):
	rotation_degrees = 0;
	state.linear_velocity.x = movx;
	state.linear_velocity.y -= fuerza_salto if salta else 0;
	pass

func _on_checkeaPiso_body_entered(body:Node):
	if (body.name == "piso"):
		print("piso");
		estaEnElPiso = true;
		pass
	pass

func _on_checkeaPiso_body_exited(body:Node):
	if (body.name == "piso"):
		print("piso");
		estaEnElPiso = false;
		pass
	pass
