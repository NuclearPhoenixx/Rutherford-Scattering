extends Label

onready var node = get_tree().get_root().get_node("Main")

func _process(_delta):
	var ekin = 0.5 * core.m1 * node.v0.length_squared() / core.ec
	text = "Ekin1 = " + str(stepify(ekin / 1e6,0.01)) + " MeV"
