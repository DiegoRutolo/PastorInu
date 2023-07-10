extends Node

func _ready():
	_on_load_nivel()

func _on_load_nivel():
	var nivel = $World.find_child("Nivel*")
	nivel.update_ovejas_guardadas.connect(_update_ovejas)
	nivel.win.connect(_handle_win)

func _update_ovejas(val):
	$HUD.num_ovejas_dentro = val

func _handle_win():
	print_debug("WIN")
