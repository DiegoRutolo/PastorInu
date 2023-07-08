extends CharacterBody2D
class_name OvejaBasica

# Velocidad a la que las ovejas se alejan del perro
@export var v_alej = 100

# Nodo del perro. Si existe, la oveja escapa
var perro
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if perro != null:
		alejarse(perro.position, delta)

# E aleja de la posición indicada
func alejarse(pos: Vector2, _delta):
	velocity = position.direction_to(pos) * -1 * v_alej
	move_and_slide();

# Cuando un perro entra en el área, se guarda en la variable
func _on_deteccion_area_2d_area_entered(area):
	if area.get_parent().is_in_group("perros"):
		perro = area.get_parent()

# Cuando el perro sale del área, el valor de la variable se borra
func _on_deteccion_area_2d_area_exited(area):
	if area.get_parent().is_in_group("perros"):
		perro = null
