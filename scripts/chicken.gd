extends CharacterBody2D

@export var speed: float = 9600.0

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.flip_h = true
		direction.x += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
		
	if direction.x == 0 && direction.y == 0:
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("walk")
	
	direction = direction.normalized()
	velocity = direction * (speed * delta)
	
	print(delta)
	
	move_and_slide()
