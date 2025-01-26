extends Area2D

var ani;
var frame;


func _ready():
	ani = get_parent().get_node("animaciones");
	pass


func _process(delta):
	#var name;
	#frame = ani.frame;
	#if (frame > 0 && frame < ani.sprite_frames.get_frame_count("activo")-3) || !ani.is_playing():
	#	name = "frame" + str(frame);
	#	print(name);
	#	#get_node(name).hide();
	#	#get_node(name).set_deferred("disbled", true);
	#	get_node(name).disabled = true;
	#frame = ani.frame - 3;
	#if (frame > 0 && frame < ani.sprite_frames.get_frame_count("activo")-3) || !ani.is_playing():
	#	name = "frame" + str(frame);
	#	print(name);
	#	#get_node(name).show();
	#	get_node(name).disabled = false;
	#	#get_node(name).set_deferred("disbled", false);
	pass
