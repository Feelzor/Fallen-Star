extends Sprite

var moon = preload("res://Moon.tscn")

func _input(event):
	if event.is_action_pressed("shoot") && event is InputEventMouseButton:
		var node = moon.instance()
		var direction = event.position - position
		node.setDirection(direction.normalized())
		add_child(node)