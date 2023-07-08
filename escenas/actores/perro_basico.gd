extends Node2D

@export var mov = 200
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vel = Vector2.ZERO
	
	if Input.is_action_pressed("Right"):
		vel.x += 1
	if Input.is_action_pressed("Left"):
		vel.x -= 1
	if Input.is_action_pressed("Down"):
		vel.y += 1
	if Input.is_action_pressed("Up"):
		vel.y -= 1
	
	vel = vel.normalized() * mov
	position += vel * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
