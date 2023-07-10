extends CanvasLayer

var num_ovejas_dentro: int = 0:
	get:
		return num_ovejas_dentro
	set(val):
		if (val >= 0):
			num_ovejas_dentro = val
		else:
			num_ovejas_dentro = 0
		$OvejasGuardadas.text = str(num_ovejas_dentro)

