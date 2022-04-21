extends Label

onready var node = get_tree().get_root().get_node("Main")

func _process(_delta):
	var dist = (node.p0 - node.p1).length()
	text = "Distance = " + str(stepify(dist / core.a0,0.00001)) + " a0"
