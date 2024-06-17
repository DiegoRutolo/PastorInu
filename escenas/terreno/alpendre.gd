class_name Alpendre
extends Area2D
## El area en la que se guardarán las ovejas para superar el nivel.

## Se lanza cuando una oveja entra en el área
signal oveja_entra

## Se lanza cuando una oveja se escapa
signal oveja_sale

## Indica si las ovejas pueden escapar una vez entraron en el área.
@export var pueden_escapar: bool = false


func _on_body_entered(body):
	if not body is Oveja:
		return
	
	var oveja: Oveja = body
	if not pueden_escapar:
		oveja.dormir()
	
	emit_signal("oveja_entra")


func _on_body_exited(body):
	if body is Oveja:
		emit_signal("oveja_sale")
