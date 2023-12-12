class_name Enemy extends Area2D

signal killed(points)
signal hit

@export var speed = 500
@export var hp = 2
@export var points = 250

func _physics_process(delta):
	global_position.x += -speed * delta

func die():
	queue_free()

func _on_body_entered(body):
	if body is Player:
		body.die()
		die()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func take_damage(amount):
	hp -= amount
	if hp <= 0:
		killed.emit(points)
		die()
	else:
		hit.emit()
