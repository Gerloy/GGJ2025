extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var body = get_node("piso");
var estaEnElPiso = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#public void OnAreaEntered(Area2D area)
#	{
#		if (area is Ball ball)
#		{
#			// Assign new direction
#			ball.direction = new Vector2(_ballDir, ((float)new Random().NextDouble()) * 2 - 1).Normalized();
#		}
#	}
