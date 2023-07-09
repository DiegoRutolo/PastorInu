extends Node

signal update_ovejas_guardadas(num)
signal win

@export
var num_ganador = 4

var ovejas_guardadas = 0:
	get:
		return ovejas_guardadas
	set(val):
		ovejas_guardadas = val
		if ovejas_guardadas >= num_ganador:
			emit_signal("win")

func _ready():
	$Cercado.entra_oveja.connect(_entra_oveja)
	$Cercado.sale_oveja.connect(_sale_oveja)

func _entra_oveja():
	ovejas_guardadas += 1
	emit_signal("update_ovejas_guardadas", ovejas_guardadas)

func _sale_oveja():
	ovejas_guardadas -= 1
	emit_signal("update_ovejas_guardadas", ovejas_guardadas)
