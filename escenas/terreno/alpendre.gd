class_name Alpendre
extends Area2D
## El area en la que se guardarán las ovejas para superar el nivel.

## Se lanza cuando una oveja entra en el área
signal oveja_entra

## Se lanza cuando una oveja se escapa
signal oveja_sale

func _on_body_entered(body):
	if not body is Oveja:
		return
	
	emit_signal("oveja_entra")


func _on_body_exited(body):
	if body is Oveja:
		emit_signal("oveja_sale")
