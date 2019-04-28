extends KinematicBody2D

const SPEED = 100
const GRAV = 3
const jump = 200
const VTOP = Vector2(0, -1)

var vel = Vector2()

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		vel.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		vel.x = SPEED
	else:
		vel.x = 0
	
	vel.y += GRAV
	
	if is_on_floor() && Input.is_action_just_pressed("ui_up"):
		vel.y += -jump
	
	vel = move_and_slide(vel, VTOP)