extends CharacterBody2D

@export var hp= 100
const SPEED = 300.0
const JUMP_VELOCITY = -500.0

@onready var enemy = $"../shadow"

@onready var health_bar = $HealthBar

@onready var anim = get_node("AnimatedSprite2D")

func _ready() -> void:
	health_bar.value = hp
	
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.y == 0:
		if velocity.x==0:
			$CollisionShape2D/AnimatedSprite2D.play("idle")
		if velocity.x>0:
			$CollisionShape2D/AnimatedSprite2D.play("walk right")
		if velocity.x<0:
			$CollisionShape2D/AnimatedSprite2D.play("walk left")

	if velocity.y!=0:
		if velocity.x==0:
			$CollisionShape2D/AnimatedSprite2D.play("idle")
		if velocity.x>0:
			$CollisionShape2D/AnimatedSprite2D.play("jump right")
		if velocity.x<0:
			$CollisionShape2D/AnimatedSprite2D.play("jump left")

	move_and_slide()
