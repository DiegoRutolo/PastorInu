extends CanvasLayer

var num_ovejas_dentro

# Called when the node enters the scene tree for the first time.
func _ready():
	num_ovejas_dentro = 0
	update_texto()

func update_texto():
	if (num_ovejas_dentro > 0):
		$OvejasGuardadas.text = str(num_ovejas_dentro)
	else:
		$OvejasGuardadas.text = ""

func mete_oveja():
	num_ovejas_dentro += 1
	update_texto()

func quita_oveja():
	num_ovejas_dentro -= 1
	update_texto()
