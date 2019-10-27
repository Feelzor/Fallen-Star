extends KinematicBody2D

var speed = 1000
var movement

func setDirection(direction):
	movement = direction

func _process(delta):
	position += delta * movement * speed
