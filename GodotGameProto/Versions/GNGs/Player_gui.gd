extends CanvasLayer

func _ready() -> void:
	Global.connect("life_changed",self,"update_life")
	update_life(Global.life)
	
func update_life(var life):
	for N in $"MarginContainer/HBoxContainer".get_children():
		if (int(N.name)<=life):
			N.visible=true
		else:
			N.visible=false
