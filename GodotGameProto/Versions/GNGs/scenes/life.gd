extends Control

var heart_size: int=88

func on_player_life_changed(player_hearts: float) -> void:
	$hearts.rect_size.x = player_hearts * heart_size
