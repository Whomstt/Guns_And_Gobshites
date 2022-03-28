extends Control

func _input(event):
	if Input.is_action_pressed('up'):
		get_tree().change_scene("res://scenes/Main.tscn")
		
