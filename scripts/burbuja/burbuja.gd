extends Node

export var scene:String; 
export var ganaste:String

func _ready():
		$AnimationPlayer.play("burbuja")
		_iniciar_timer(45)

#func _on_hitbox_area_entered(area):
#	get_tree().change_scene(scene);
#	print("perdiste");
#	$Timer.stop()


func _iniciar_timer(segundos: float):
	$Timer.wait_time = segundos;
	$Timer.start();

func _on_Timer_timeout():
	get_tree().change_scene(ganaste);
	



func _on_burbuja_area_entered(area:Area2D):
	if area.name != "dimitrescu" && area.name != "AREA":
		get_tree().change_scene(scene);
		print("perdiste");
		$Timer.stop();
	pass # Replace with function body.
