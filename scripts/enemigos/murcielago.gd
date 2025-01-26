extends Node

func _ready():
	pass 

func _on_Enemigo_body_entered(body:Node):
	if body.name == "player":
		$AnimationPlayer.play("murcielago");
		$activador.queue_free()
		#$animaciones.modulate.a8 = 50
		#$animaciones.play("death")
	pass 
	
	# ANIMACION DE MUERTE 
func _muerte_murcielago(body:Node):
	$animaciones.modulate.a8 = 50
	$animaciones.play("death");
	$CollisionShape2D.queue_free()
