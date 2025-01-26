extends Sprite


var ang;
#onready var bala = $bala;
onready var parent = get_parent();
onready var main_node = get_parent().get_parent();
onready var bala = main_node.get_node("bala");

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	ang = parent.get_node("animaciones").global_position.angle_to(main_node.get_global_mouse_position());
	var mov = parent.get_node("animaciones").global_position.direction_to(main_node.get_global_mouse_position());

	global_position = Vector2(parent.get_node("animaciones").global_position.x+mov.x*20, parent.get_node("animaciones").global_position.y+mov.y*20);

	if main_node.get_global_mouse_position().x < parent.global_position.x:
		scale.y = -abs(scale.y);
		rotation_degrees = rad2deg(-ang);
	else:
		scale.y = abs(scale.y);
		rotation_degrees = rad2deg(ang);

	if Input.is_action_just_released("atk_gom"):
		#TODO que vuele la bala
		bala.show();
		if bala.puede_disparar:
			bala.disparar(ang);
		#hide();
		#visible = false;
		modulate.a = 0;
		pass
	pass
