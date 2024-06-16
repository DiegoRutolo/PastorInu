class_name Oveja
extends CharacterBody2D

# Velocidad al andar
const VEL_ANDAR = 40
# Velocidad al correr
const VEL_CORRER = 85

enum Movimiento {QUIETO, ANDAR, CORRER}
var movimineto: Movimiento = Movimiento.QUIETO

# Distancia a partir de la cual se considera que llegó al objetivo
const RANGO_LLEGADA = 20
# Distancia máxima a la que selecciona objetivo
const RANGO_TARGET = 100
var target_pos: Vector2

const TIMER_MIN = 2
const TIMER_MAX = 6


func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	select_new_target()

func _physics_process(_delta):
	if position.distance_to(target_pos) <= RANGO_LLEGADA:
		movimineto = Movimiento.QUIETO
	else:
		movimineto = Movimiento.ANDAR
	moverse()
	
func moverse():
	if movimineto == Movimiento.QUIETO:
		velocity = Vector2.ZERO
	elif movimineto == Movimiento.ANDAR:
		velocity = position.direction_to(target_pos) * VEL_ANDAR
	move_and_slide()

func select_new_target():
	var dist = randf() * RANGO_TARGET
	var dir = Vector2.RIGHT.rotated(2*PI*randf())
	target_pos = dir * dist
	$Timer.start(randf_range(TIMER_MIN, TIMER_MAX))

