extends KinematicBody2D

export var speed: float = 200.0

onready var anim = $AnimatedSprite

var velocity = Vector2.ZERO
var is_dead = false 

func die():
	is_dead = true
	anim.play("death")
	velocity = Vector2.ZERO 
	yield(get_tree().create_timer(1.5), "timeout") 
	queue_free() 

func _physics_process(delta):
	if is_dead:  
		return 

	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		anim.flip_h = false
		anim.play("run")
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		anim.flip_h = true
		anim.play("run")
	elif Input.is_action_pressed("ui_down"):
		velocity.y += speed
		anim.play("run")
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= speed
		anim.play("run")
	else:
		anim.play("idle") 

	move_and_slide(velocity)
