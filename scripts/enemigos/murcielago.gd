extends Node

func _ready():
	pass 

func _on_Enemigo_body_entered(body:Node):
	if body.name == "player":
		$AnimationPlayer.play("murcielago");
		
		#if $activador:
			#$activador.queue_free();
		#$animaciones.modulate.a8 = 50
		#$animaciones.play("death")
	pass 
	
	# ANIMACION DE MUERTE 
func _muerte_murcielago():
	$animaciones.modulate.a8 = 20
	$animaciones.play("death");
	$CollisionShape2D.queue_free()
	$Light2D.hide()

func muerto():
	_muerte_murcielago();
	#print("MUELTO");
	#$animaciones.animation = "death";
	#if $hitbox:
		#$hitbox.queue_free();
	if $activador:
		$activador.queue_free();
	#pega = false;
