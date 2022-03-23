extends KinematicBody2D

onready var bullet = preload("res://scenes/Bullet.tscn")
var b

var gravity := 50
var direction := Vector2.ZERO

func _physics_process(delta):
	move()
	shoot()
	direction = move_and_slide(direction, Vector2.UP)

func shoot():
	if Input.is_action_just_pressed('shoot'):
		b = bullet.instance()
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position

func move():
	gravity += 5
	if Input.is_action_pressed('right'):
		direction.x = 400
	elif Input.is_action_pressed('left'):
		direction.x = -400
	else:
		direction.x = 0
	if Input.is_action_just_pressed('up') and is_on_floor():
		gravity = -300
	direction.y = gravity
	
