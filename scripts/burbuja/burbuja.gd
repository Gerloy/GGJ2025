extends Node

export var scene:String; 
export var ganar:String;

func _ready():
		$AnimationPlayer.play("burbuja")
		
func _on_hitbox_area_entered(area):
	get_tree().change_scene(scene);
	#print("perdiste");	
	#queue_free();


func _on_burbuja_area_entered(area:Area2D):
	get_tree().change_scene(scene);
	pass # Replace with function body.


func _on_Timer_timeout():
	get_tree().change_scene(ganar); 
	pass # Replace with function body.
