extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vulnerable;
var pega;

# Called when the node enters the scene tree for the first time.
func _ready():
	vulnerable = false;
	pega = true;
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemigo_body_entered(body:Node):
	if body.name == "player":
		$animaciones.animation = "activo";
		if $hitbox:
			$hitbox.show();
		vulnerable = true;
	pass # Replace with function body.


func _on_hitbox_body_entered(body:Node):
	if body.name == "player" && pega:
		body.restarVida();
	pass # Replace with function body.

func muerto():
	print("MUELTO");
	$animaciones.animation = "muerto";
	$Light2D.hide();
	$Light2D2.hide();
	
	if $hitbox:
		$hitbox.queue_free();
	if $activador:
		$activador.queue_free();
	pega = false;

	pass
