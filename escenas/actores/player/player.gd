extends CharacterBody2D
class_name Player

# Distancia a partir de la cual empieza a moverse
const LIM_QUIETO = 5

# Dístancia a partir de la cual se decide si correr o andar.
const LIM_ANDAR = 80

# Velocidad al andar
const VEL_ANDAR = 75
# Velocidad al correr
const VEL_CORRER = 170
# Velocidad al esprintar
const VEL_SPRINT = 320

# Definicion de los ángulos para las animaciones.
const CORTE_VERTICAL: float = 0.4
var ARRIBA_DERECHA: float = Vector2.UP.angle() + CORTE_VERTICAL
var ARRIBA_IZQUIERDA: float = Vector2.UP.angle() - CORTE_VERTICAL
var ABAJO_DERECHA: float = Vector2.DOWN.angle() - CORTE_VERTICAL
var ABAJO_IZQUIERDA: float = Vector2.DOWN.angle() + CORTE_VERTICAL

enum Movimiento {QUIETO, ANDAR, CORRER, SPRINT}
var movimineto: Movimiento = Movimiento.QUIETO:
	get:
		return movimineto
	set(val):
		movimineto = val
		#print_debug("Movimiento: %s" % val)

enum Accion {NADA, LADRAR, GRUÑIR}
var accion: Accion = Accion.NADA

# Posición en la que el jugador hace click para moverse
var click_pos: Vector2

# Posición hacia la que el perro intenta moverse.
var target_pos: Vector2

func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	click_pos = position
	target_pos = position

func _physics_process(_delta):
	if Input.is_action_pressed("right_click"):
	#if Input.is_action_just_pressed("right_click"):
		click_pos = get_global_mouse_position()
	
	if position.distance_to(click_pos) <= LIM_QUIETO:
		movimineto = Movimiento.QUIETO
		target_pos = position
	else:
		target_pos = click_pos
		if position.distance_to(target_pos) <= LIM_ANDAR:
			movimineto = Movimiento.ANDAR
		else:
			movimineto = Movimiento.CORRER
	mover()

func mover():
	if movimineto == Movimiento.QUIETO:
		velocity = Vector2.ZERO
	elif movimineto == Movimiento.ANDAR:
		velocity = position.direction_to(target_pos) * VEL_ANDAR
	elif movimineto == Movimiento.CORRER:
		velocity = position.direction_to(target_pos) * VEL_CORRER
	elif movimineto == Movimiento.SPRINT:
		velocity = position.direction_to(target_pos) * VEL_SPRINT
	
	# Animación
	#$AnimatedSprite2D.stop()
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("sit")
	elif velocity.angle() < ARRIBA_DERECHA and velocity.angle() > ARRIBA_IZQUIERDA:
		$AnimatedSprite2D.play("walk_up")
	elif velocity.angle() > ABAJO_DERECHA and velocity.angle() < ABAJO_IZQUIERDA:
		$AnimatedSprite2D.play("walk_down")
	elif velocity.angle() >= ARRIBA_DERECHA and velocity.angle() <= ABAJO_DERECHA:
		$AnimatedSprite2D.play("walk_right")
	elif velocity.angle() >= ABAJO_IZQUIERDA or velocity.angle() <= ARRIBA_IZQUIERDA:
		$AnimatedSprite2D.play("walk_left")
	
	move_and_slide()

