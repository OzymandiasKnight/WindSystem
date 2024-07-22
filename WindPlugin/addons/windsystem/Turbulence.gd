@tool
extends Node2D
class_name Turbulence

##Draw Blow Range and Strenght
@export var debug:bool = false

##Delay 0 = Constant Blow
## ||| Delay > 0 = Repetitive Blow each "delay" seconds
## ||| Delay < 0 = Blow on demand fading away after "delay" seconds
@export var delay:float = 0.0

##Blow distance in pixels
@export var strenght:float = 10.0

var timer:Timer = Timer.new()


var force:float = 1.0

var is_game:bool = false

func _draw():
	if debug:
		if delay == 0:
			draw_circle(Vector2(0,0),strenght,Color.BLUE)
		else:
			draw_circle(Vector2(0,0),force,Color.BLUE)


func _ready():
	if child_exiting_tree.is_connected(remove_self) == false:
		child_exiting_tree.connect(remove_self)
	
	is_game = !Engine.is_editor_hint()
	
	
	if delay > 0:
		if is_game:
			timer.set_wait_time(abs(delay))
			timer.timeout.connect(blow)
			add_child(timer)
			if delay > 0:
				timer.start()

	else:
		force = strenght
	
	
	WindSystem.add_turbulence(self)

func _physics_process(delta):
	if debug:
		queue_redraw()
	
	if delay == 0:
		if force != strenght:
			force = strenght
	else:
		if force > 0:
			if delay > 0:
				force = max(0,force-(delta/delay)*strenght)
			else:
				force = max(0,force-(delta/-delay)*strenght)

func blow():
	force = strenght
	timer.stop()
	if delay > 0:
		timer.start()

func remove_self(guess):
	WindSystem.remove_turbulence(self)
