extends Node

## Cuando se completa el nivel
signal win

## Numero de ovejas necesarias para ganar
@export var ovejas_objetivo: int = 1
var ovejas_dentro: int = 0

func _on_alpendre_oveja_entra():
	ovejas_dentro += 1
	print_debug("Oveja entra")
	
	if ovejas_dentro >= ovejas_objetivo:
		print_debug("WIN")
		win.emit()

func _on_alpendre_oveja_sale():
	ovejas_dentro -= 1
	print_debug("Oveja sale")
