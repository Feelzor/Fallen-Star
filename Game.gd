extends Node2D

var star = preload("res://Star.tscn")

func _ready():
	get_tree().paused = false
	randomize()
	$SpawnTimer.wait_time = 1.2
	spawn()
	
func spawn():
	var node = star.instance()
	node.position.x = randi() % 1200 + 40
	add_child(node)

func _on_SpawnTimer_timeout():
	spawn()
	
func endGame():
	$GameOver.visible = true
	get_tree().paused = true
	$RestartGame.start()

func _on_RestartGame_timeout():
	get_tree().reload_current_scene()

func reduceTime():
	$SpawnTimer.wait_time -= 0.1
	if ($SpawnTimer.wait_time < 0.8):
		$SpawnTimer.wait_time = 0.8