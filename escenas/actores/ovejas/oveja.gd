class_name Oveja
extends CharacterBody2D

# Velocidad al andar
const VEL_ANDAR = 40
# Velocidad al correr
const VEL_CORRER = 85

enum Movimiento {QUIETO, ANDAR, HUIR}
var movimineto: Movimiento = Movimiento.QUIETO

# Distancia a partir de la cual se considera que llegó al objetivo
const RANGO_LLEGADA = 20
# Distancia máxima a la que selecciona objetivo
const RANGO_TARGET = 200
var target_pos: Vector2

# Tiempo mínimo de espera para adquirir objetivo
const TIMER_MIN = 2
# Tiempo máximo de espera para adquirir objetivo
const TIMER_MAX = 6

# El Perro del que huyen
@export var perro: Player
# Distancia a la que empieza a huir del perro
const RANGO_PERRO = 250

func _get_configuration_warnings():
	var warns = []
	if perro == null:
		warns.append("Necesita un perro")
	return warns

func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	select_new_target()

func _physics_process(_delta):
	# Decidir acción
	if global_position.distance_to(perro.position) <= RANGO_PERRO:
		movimineto = Movimiento.HUIR
	elif position.distance_to(target_pos) <= RANGO_LLEGADA:
		movimineto = Movimiento.QUIETO
	else:
		movimineto = Movimiento.ANDAR
	
	# Hacer movimiento
	if movimineto == Movimiento.QUIETO:
		velocity = Vector2.ZERO
	elif movimineto == Movimiento.ANDAR:
		velocity = position.direction_to(target_pos) * VEL_ANDAR
	elif movimineto == Movimiento.HUIR:
		velocity = global_position.direction_to(perro.position) * VEL_CORRER * -1
	move_and_slide()

func select_new_target():
	var dist = randf() * RANGO_TARGET
	var dir = Vector2.RIGHT.rotated(2*PI*randf())
	target_pos = dir * dist
	$Timer.start(randf_range(TIMER_MIN, TIMER_MAX))

