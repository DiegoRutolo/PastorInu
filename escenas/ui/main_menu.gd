extends Control


func _on_aleatorios_pressed():
	#GameState.load_level("res://escenas/niveles/nivel_0.tscn")
	pass
	

func _on_salir_pressed():
	GameState.salir()


func _on_niveles_pressed():
	GameState.load_menu("niveles")
