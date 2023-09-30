extends Node2D

var sprite=0;
var sprite_dict={
	0:"arrow_left.png",
	1:"arrow_right.png",
	2:"arrow_up.png",
	3:"arrow_down.png",
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func change_sprite(s):
	$Sprite.set_texture(ImageTexture.create_from_image(Image.load_from_file("res://assets/arrows/"+sprite_dict.get(s))))
	sprite=s
