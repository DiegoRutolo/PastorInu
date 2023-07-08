extends CharacterBody2D

@export var mov = 100

# Posicion del perro. Si existe, la oveja escapa
var perro

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if perro != null:
		alejarse(delta, perro.position)

func alejarse(delta, posPerro: Vector2):
	velocity = position.direction_to(posPerro) * -1 * mov
	move_and_slide();

func _on_deteccion_area_2d_area_entered(area):
	if area.get_parent().is_in_group("perros"):
		perro = area.get_parent()

func _on_deteccion_area_2d_area_exited(area):
	if area.get_parent().is_in_group("perros"):
		perro = null
