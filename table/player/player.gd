extends Node3D
class_name Player
var pos:int
var color:Color
const player_offset = Vector3(-2,1.5,2)

@onready var label = $Label3D
@onready var meshInstance = $RigidBody3D/MeshInstance3D
@onready var rigidBody3D = $RigidBody3D

var walking := false
var destion := Vector3(0,0,0)
var walking_speed = 50

func walk_to(pos):
	walking = true
	destion = pos + player_offset

func process_walk(delta):
	if walking :
		if (destion - position).length() <= walking_speed * delta :
			walking = false
			GameControl.animeMutex.unlock()
			position = destion
		else :
			position = position + walking_speed * (destion - position).normalized() * delta
		

func set_pos(num:int):
	self.pos = num;
	#meshInstance.get_surface_override_material(0).set_shader_parameter("color",Color.BLUE)
	pass

var focused = false

func mouse_entered():
	focused = true
	
func mouse_exited():
	focused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rigidBody3D.mouse_entered.connect(mouse_entered)
	rigidBody3D.mouse_exited.connect(mouse_exited)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _process(delta: float) -> void:
	if focused :
		meshInstance.get_surface_override_material(0).set_shader_parameter("color",Color.RED)
	else :
		meshInstance.get_surface_override_material(0).set_shader_parameter("color",Color.YELLOW)
	process_walk(delta)
	pass
