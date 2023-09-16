extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Artist_Attacks.disable_all()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_start_button_pressed():
	$Fight.disable()
	$Artist_Attacks.show()
	$Artist_Attacks.enable_all()
	pass # Replace with function body.


func _on_cancel_button_pressed():
	$Artist_Attacks.hide()
	$Artist_Attacks.disable_all()
	$Fight.enable()
	pass # Replace with function body.
