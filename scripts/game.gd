extends Node2D

var timer=0.0;

var cooldown_timer=0.0;

@onready var arrow_obj = preload("res://scenes/arrow.tscn")

var arrow_children = []

var dir_pressed = [false, false , false, false]
# Called when the node enters the scene tree for the first time.
var attack_mode = false

const max_arrows = 5

var num_arrows = 5

func _ready():
	pass; # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dir_pressed=[Input.is_action_just_pressed("left"),Input.is_action_just_pressed("right"),Input.is_action_just_pressed("up"),Input.is_action_just_pressed("down")]
	if(dir_pressed.any(func(n): return n) and attack_mode and cooldown_timer<0):
		dir_attack()
	if(attack_mode and $Arrows.get_child_count()==0):
		attack_mode=false;
		$Artist_Attacks.enable_all()
	cooldown_timer-=delta;
	timer+=delta;
	$Static_Sprites/PenBlade.translate(Vector2(0,sin(timer*4)/2));
	pass;


func _on_attack_button_pressed():
	gen_arrows(max_arrows)
	num_arrows=max_arrows
	$Artist_Attacks.disable_all()
	attack_mode=true
	pass

func gen_arrows(num):
	for i in num:
		$Arrows.add_child(arrow_obj.instantiate())
		arrow_children.push_back($Arrows.get_children()[i])
		if num > 1:
			arrow_children[i].translate(Vector2(-(num*45)+i*90,0))
			arrow_children[i].change_sprite(randi_range(0,3))
		

func dir_attack():
	play_anim()
	print(dir_pressed.find(true))
	cooldown_timer=0.35
	if(arrow_children.back().sprite==dir_pressed.find(true)):
		arrow_children.back().queue_free()
		arrow_children.pop_back()
	pass

func play_anim():
	$Static_Sprites/The_Artist.hide();
	$Static_Sprites/PenBlade.hide();
	$Artist_Anim.show();
	$Artist_Anim.play();
	pass # Replace with function body.


func _on_artist_anim_animation_finished():
	$Artist_Anim.stop();
	$Artist_Anim.hide();
	$Static_Sprites/The_Artist.show();
	$Static_Sprites/PenBlade.show();
	
	pass # Replace with function body.
