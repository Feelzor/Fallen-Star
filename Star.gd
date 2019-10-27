extends Area2D

var speed

func _ready():
	speed = randi() % 200 + 250

func _process(delta):
	position.y += speed * delta
	if (position.y > 720):
		get_tree().get_current_scene().endGame()

func _on_Star_body_entered(body):
	queue_free()
	body.queue_free()
	var scoreNode = get_tree().get_current_scene().get_node("Score")
	var score = int(scoreNode.get_text()) + 1
	scoreNode.set_text(str(score))
	
	if score % 20 == 0:
		get_tree().get_current_scene().reduceTime()
