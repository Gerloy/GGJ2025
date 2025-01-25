extends RigidBody2D

enum Estado{
	IDLE,
	MOVIZ,
	MOVDE,
	SALTA
}
var estado;

var mov;
var ani;


# Called when the node enters the scene tree for the first time.
func _ready():
	mov = $hitbox;
	ani = $Sprite;
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state):
	rotation_degrees = 0;
	state.linear_velocity.x = mov.movx;
	state.linear_velocity.y -= mov.fuerza_salto if mov.salta else 0;
	pass


func cambiarEstado(e):
	estado = e;
	pass

##TODO llenar la funcion esta cuando sepamos como es el tema de la vida
func restarVida():
	pass