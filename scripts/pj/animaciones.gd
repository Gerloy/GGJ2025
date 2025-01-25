extends Sprite

enum Estado{
	IDLE,
	MOVIZ,
	MOVDE,
	SALTA,
	CAYO
}
var estado = Estado.IDLE;

#Cosas de timing
export var rate:float = 250;
var time = 0;
var id = 0;

#animaciones
export(Array,Texture) var ani_caminar;
#export var paths:Array;
export var spr_idle:Texture;
export var spr_salta:Texture;


# Called when the node enters the scene tree for the first time.
func _ready():
	#var i = 0;
	#for path in paths:
	#	ani_caminar[i] = load(path);
	#	i+=1
	#paths.clear();
	#i=null;

	#Hacemos las texturas espejadas

	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match estado:
		Estado.IDLE:
			time = 0;
			id = 0;
			texture = spr_idle;

		Estado.SALTA:
			time = 0;
			id = 1;
			texture = spr_salta;

		Estado.MOVIZ:
			time += delta;
			if time>=rate:
				id = 1 if id == 0 else 0;
				#print(id);
				#id += 1;
				#if id >= ani_caminar.length:
				#	id = 0;
				time = 0;
			scale.x = -3;
			texture = ani_caminar[id];

		Estado.MOVDE:
			time += delta;
			if time>=rate:
				id = 1 if id == 0 else 0;
				#id +=1 ;
				#if id >= ani_caminar.length:
				#	id = 0;
				time = 0;
			scale.x = 3;
			texture = ani_caminar[id];

		_:
			print("Se rompio algo en los estados. No matchea con ninguno");
	pass

func cambiarEstado(e):
	estado = e;
	pass
