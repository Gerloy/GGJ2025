extends AnimatedSprite

export var scene:String;
export var ani:String;



func _ready():
	animation = ani;
	pass

func _process(_delta):		
	pass


func _on_cinematica_animation_finished():
	get_tree().change_scene(scene);
	pass
