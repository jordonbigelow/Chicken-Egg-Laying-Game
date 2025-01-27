extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		$Sprite2D.flip_h = false
	if Input.is_action_pressed("move_right"):
		$Sprite2D.flip_h = true
		direction.x += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	
	direction = direction.normalized()
	velocity = direction * speed
	
	move_and_slide()
