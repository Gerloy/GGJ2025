extends Area2D

var ani;# = get_parent().get_node("animaciones");
var frame;


func _ready():
	ani = get_parent().get_node("animaciones");
	pass


func _process(delta):
	var name;
	frame = ani.frame;
	if frame > 0 && !ani.is_playing():#frame <= ani.get_animation().get_frame_count-3:
		name = "frame" + str(frame);
		get_node(name).hide();
	frame = ani.frame - 3;
	if frame > 0 && !ani.is_playing():#frame <= ani.get_frame_count-3:
		name = "frame" + str(frame);
		get_node(name).show();
	pass
