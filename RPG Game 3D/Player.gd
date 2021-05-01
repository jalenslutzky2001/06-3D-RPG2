extends KinematicBody

var speed = 10
var acceleration = 5
var velocity = Vector3()
var direction = Vector3()


var mouse_sensitivity = 0.1
func _ready():
	$AnimationPlayer.play("Idle")
	
func _inpput(event):
	pass
		
func _process(delta):
	direction = Vector3()
	
	if Input.is_action_pressed("backward"):
		direction -= transform.basis.z
		
	elif Input.is_action_pressed("forward"):
		direction +=transform.basis.z
		
	if Input.is_action_pressed("right"):
		direction -= transform.basis.x
	if Input.is_action_pressed("left"):
		direction += transform.basis.x
	direction = direction.normalized()
	velocity = direction * speed
	velocity.linear_interpolate(velocity, acceleration * delta)
	move_and_slide(velocity, Vector3.UP)
