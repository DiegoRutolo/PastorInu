extends OvejaBasica

# Velocidad a la que las ovejas deambulan
@export var v_deamb = 40
# Posición hacia la que se va a mover al deambular
var pos_deamb

func _physics_process(delta):
	super._physics_process(delta)
	deambular(delta)

# Se mueve sin rumbo fijo
func deambular(_delta):
	# Asignar valor a la pos objetivo
	if pos_deamb == null or position.distance_to(pos_deamb) <= v_deamb:
		set_pos_deamb()
	
	velocity = position.direction_to(pos_deamb) * v_deamb
	move_and_slide();

func set_pos_deamb():
	pos_deamb = Vector2.ZERO;
	pos_deamb.x = randi() % int(screen_size.x)
	pos_deamb.y = randi() % int(screen_size.y)
