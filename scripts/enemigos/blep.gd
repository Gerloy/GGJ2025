extends Node

var pega;

# Called when the node enters the scene tree for the first time.
func _ready():
	pega = true;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemigo_body_entered(body:Node):
	#if body.name == "player":
		#$animaciones.play("death");
		#$activador.hide();
		#$Light2D.hide()
	pass # Replace with function body.


func _on_hitbox_body_entered(body:Node):
	if body.name == "player" && pega:
		body.restarVida();
	pass # Replace with function body.

func muerto():
	$animaciones.play("death");
	$activador.hide();
	$Light2D.hide();
	pega = false;
	pass

