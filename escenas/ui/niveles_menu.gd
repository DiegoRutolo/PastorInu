extends Control


func _on_salir_pressed():
	GameState.salir()


func _on_back_pressed():
	GameState.load_menu("main")


func _on_nivel_1_pressed():
	GameState.load_level("res://escenas/niveles/ordinales/nivel_1.tscn")
