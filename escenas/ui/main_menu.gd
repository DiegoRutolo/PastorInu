extends Control


func _on_aleatorios_pressed():
	GameState.load_level("random")
	

func _on_salir_pressed():
	GameState.salir()


func _on_niveles_pressed():
	GameState.load_menu("niveles")
