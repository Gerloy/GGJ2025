extends Node

func _ready():
		$AnimationPlayer.play("burbuja")
		
func _on_hitbox_area_entered(area):
	print("perdiste");
	queue_free();
