extends Node3D
class_name Block
var num:int
var color:Color;

@onready var label = $Label3D
@onready var meshInstance = $RigidBody3D/MeshInstance3D
@onready var rigidBody3D = $RigidBody3D

func set_num(num:int):
	self.num = num;
	label.text = str(self.num)
	#meshInstance.get_surface_override_material(0).set_shader_parameter("color",Color.BLUE)
	pass

var focused = false

func mouse_entered():
	focused = true
	
func mouse_exited():
	focused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rigidBody3D.mouse_entered.connect( mouse_entered)
	rigidBody3D.mouse_exited.connect(mouse_exited)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _process(delta: float) -> void:
	if focused :
		meshInstance.get_surface_override_material(0).set_shader_parameter("color",Color.RED)
	else :
		meshInstance.get_surface_override_material(0).set_shader_parameter("color",Color.BLUE)
		
	pass
