extends KinematicBody2D

var gravity = 4
var acceleration = 75
var jump_height = -130

var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input.x == 0:
		velocity.x = 0
	else:
		velocity.x = input.x * acceleration
		if input.x > 0:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			$Jump.play()
			velocity.y += jump_height
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func apply_gravity():
	velocity.y += gravity
