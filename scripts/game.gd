extends Node2D

var timer=0.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass; # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=delta;
	$Static_Sprites/PenBlade.translate(Vector2(0,sin(timer*4)/2));
	pass;
