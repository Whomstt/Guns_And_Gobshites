extends KinematicBody2D

signal life_changed(player_hearts)

onready var bullet = preload("res://scenes/Bullet.tscn")
var b

var gravity := 50
var direction := Vector2.ZERO

var max_hearts: int = 3
var hearts: float = max_hearts

func _ready() -> void:
	connect("life_changed", get_parent().get_node("UI/life"),"on_player_life_changed")
	emit_signal("life_changed", max_hearts)


func _physics_process(delta):
	move()
	shoot($AnimatedSprite.flip_h)
	direction = move_and_slide(direction, Vector2.UP)

func shoot(dir):
	if Input.is_action_just_pressed('shoot'):
		b = bullet.instance()
		b.init(dir)
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position
		

func move():
	if not is_on_floor():
		gravity += 20
	if Input.is_action_pressed('right'):
		direction.x = 600
		$Position2D.position.x = 150
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('run')
	elif Input.is_action_pressed('left'):
		direction.x = -600
		$Position2D.position.x = -110
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('run')
	else:
		direction.x = 0
		$AnimatedSprite.play('idle')
	if Input.is_action_just_pressed('up') and is_on_floor():
		gravity = -700
	direction.y = gravity
	
	
func death():
	if (hearts<=0):
		get_tree().change_scene("res://scenes/Intro.tscn")





