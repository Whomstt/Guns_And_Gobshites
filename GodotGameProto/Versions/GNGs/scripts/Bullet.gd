extends Sprite

var direction = false

func init(d):
	direction = d
	
func _ready():
	scale = Vector2(0.25, 0.25)

func _physics_process(delta):
	if direction:
		position.x -= 20
	else:
		position.x += 20

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func destroy():
	queue_free()
