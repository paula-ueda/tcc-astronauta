extends KinematicBody2D

var sent = 1

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var new_offset = get_parent().get_unit_offset() + delta*sent*0.2
	if sent == 1 and new_offset >= 0.99999:
		sent = -1
		get_parent().set_unit_offset(0.99999)
	elif sent == -1 and new_offset <= 0:
		sent = 1
		get_parent().set_unit_offset(0)
	else:
		get_parent().set_unit_offset(new_offset)

func esmagar():
	get_node("anim").stop()
	get_node("sprite").set_texture(load("res://assets/Inimigo/slimeDead.png"))
	get_node("sprite").set_offset(Vector2(0,8))
	get_node("shape").queue_free()
	set_fixed_process(false)
	