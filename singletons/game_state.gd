extends Node

func salir():
	get_tree().quit(0)

func load_level(nivel: String):
	match nivel:
		"random":
			get_tree().change_scene_to_file("res://escenas/niveles/nivel_0.tscn")

func load_menu(menu: String):
	match menu:
		"main":
			get_tree().change_scene_to_file("res://escenas/ui/main_menu.tscn")
		"niveles":
			get_tree().change_scene_to_file("res://escenas/ui/niveles_menu.tscn")
