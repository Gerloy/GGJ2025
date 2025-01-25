extends Sprite

#enum Estado{
#	IDLE,
#	MOVIZ,
#	MOVDE,
#	SALTA
#}
#var estado = Estado.IDLE;

#Cosas de timing
export var rate:float = 250;
var time = 0;
var id = 0;

var pj;

#animaciones
export(Array,Texture) var ani_caminar;
#export var paths:Array;
export var spr_idle:Texture;
export var spr_salta:Texture;


func _ready():
	pj = get_parent();
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match pj.estado:
		pj.Estado.IDLE:
			time = 0;
			id = 0;
			texture = spr_idle;

		pj.Estado.SALTA:
			time = 0;
			id = 1;
			texture = spr_salta;

		pj.Estado.MOVIZ:
			time += delta;
			if time>=rate:
				id = 1 if id == 0 else 0;
				time = 0;
			scale.x = -3;
			texture = ani_caminar[id];

		pj.Estado.MOVDE:
			time += delta;
			if time>=rate:
				id = 1 if id == 0 else 0;
				time = 0;
			scale.x = 3;
			texture = ani_caminar[id];

		_:
			print("Se rompio algo en los estados. No matchea con ninguno");
	pass

#func cambiarEstado(e):
#	estado = e;
#	pass
