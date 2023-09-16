extends Node2D

var is_disabled = false
signal button_pressed
# Called when the node enters the scene tree for the first time.
func _ready():

	return;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	return;


func _on_button_2_mouse_entered():
	if is_disabled:
		return;
	$Sprite.show();
	return;


func _on_button_2_mouse_exited():
	if is_disabled:
		return;
	$Sprite.hide();
	return;


func _on_button_2_pressed():
	button_pressed.emit();
	return;

func enable():
	is_disabled=false;
	$Button.disabled=false;
	$Button.mouse_default_cursor_shape=Button.CURSOR_POINTING_HAND;
	return;
	
func disable():
	is_disabled=true;
	$Button.disabled=true;
	$Button.mouse_default_cursor_shape=Button.CURSOR_ARROW;
	$Sprite.hide();
	return;

