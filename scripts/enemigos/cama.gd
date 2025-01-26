extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Enemigo_body_entered(body:Node):
	if body.name == "player":
		$animaciones.play("muerte");
		$activador.hide();
		$Light2D.hide()
	pass # Replace with function body.


func _on_hitbox_body_entered(body:Node):
	if body.name == "player":
		body.restarVida();
	pass # Replace with function body.


