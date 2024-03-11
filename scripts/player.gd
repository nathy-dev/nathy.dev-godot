extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_animation("run")
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_animation("run")
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_animation("run")
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_animation("run")
		velocity.x = 0
		velocity.y = -speed
	else:
		play_animation("idle")
		velocity.x = 0
		velocity.y = 0
	move_and_slide()

func play_animation(movement):
	var dir = current_dir
	var animation = $AnimatedSprite2D
	
	if dir == "right":
		animation.flip_h = false
		if movement == "run":
			animation.play("side_run")
		elif movement == "idle":
			animation.play("side_idle")
	elif dir == "left":
		animation.flip_h = true
		if movement == "run":
			animation.play("side_run")
		elif movement == "idle":
			animation.play("side_idle")
	elif dir == "up":
		animation.flip_h = false
		if movement == "run":
			animation.play("back_run")
		elif movement == "idle":
			animation.play("back_idle")
	elif dir == "down":
		animation.flip_h = false
		if movement == "run":
			animation.play("run")
		elif movement == "idle":
			animation.play("idle")
