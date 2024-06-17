extends Control


func _on_salir_pressed():
	GameState.salir()


func _on_back_pressed():
	GameState.load_menu("main")
