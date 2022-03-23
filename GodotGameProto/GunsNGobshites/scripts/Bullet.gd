extends Sprite

func _ready():
	scale = Vector2(0.25, 0.25)

func _physics_process(delta):
	position.x += 10


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
