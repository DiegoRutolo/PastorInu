extends Node

@onready
var nivel = $World.find_child("Nivel*")

func _ready():
	nivel.update_ovejas_guardadas.connect(_update_ovejas)

func _update_ovejas(val):
	$HUD.num_ovejas_dentro = val

