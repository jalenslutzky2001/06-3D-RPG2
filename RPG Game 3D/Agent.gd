extends KinematicBody


var velocity = Vector3()
var direction = 1
var speed = .05

func _ready():
	pass
	
func _physics_process(delta):
	velocity.x += 2
	
	if is_on_wall():
		direction = direction * -1
	
	if direction == 1:
		velocity.x = 2
	elif direction == -1:
		velocity.x = -2
	
	velocity = move_and_slide(velocity, Vector3.UP)


