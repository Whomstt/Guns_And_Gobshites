extends Node

var max_life=3
var life=max_life

signal life_changed(life)

func update_life(var delta):
	life+=delta
	emit_signal("life_changed",life)
	if(life<=0):
		pass


func return_to_menu():
	get_tree().change_scene("res://scenes/Background.tscn")
