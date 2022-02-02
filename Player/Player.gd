extends KinematicBody2D

var velocity = Vector2.ZERO
var rotationSpeed = 5
var speed = .1
var maxSpeed = 10
func _ready():
	pass
	
func _physics_process(_delta):
	position = position + velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0, maxSpeed)
	if Input.is_action_pressed("left"):
		rotation_degrees = rotation_degrees - rotationSpeed
	if Input.is_action_pressed("right"):
		rotation_degrees = rotation_degrees + rotationSpeed
	$Exhaust.hide()
	if Input.is_action_pressed("forward"):
		velocity = velocity + Vector2(0,-speed).rotated(rotation)
		$Exhaust.show()


	position.x = wrapf(position.x, 0, 1024)
	position.y = wrapf(position.y, 0, 600)
