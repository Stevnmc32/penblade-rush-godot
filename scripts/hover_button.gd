extends Node2D

var is_disabled = false
signal button_pressed
# Called when the node enters the scene tree for the first time.űű

var should_show=false
var show_status_changed=false

func _ready():
	return;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_disabled and show_status_changed:
		if should_show:
			$Sprite.show()
		else:
			$Sprite.hide()
		show_status_changed=false
	return;


func _on_button_2_pressed():
	button_pressed.emit();
	return;

func enable():
	is_disabled=false;
	$Button.disabled=false;
	$Button.mouse_default_cursor_shape=Button.CURSOR_POINTING_HAND;
	if should_show:
		$Sprite.show();
	return;
	
func disable():
	is_disabled=true;
	$Button.disabled=true;
	$Button.mouse_default_cursor_shape=Button.CURSOR_ARROW;
	$Sprite.hide();
	return;



func _on_button_mouse_entered():
	should_show=true
	show_status_changed=true
	return;


func _on_button_mouse_exited():
	should_show=false
	show_status_changed=true
	return;
