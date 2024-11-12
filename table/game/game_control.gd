extends Node3D
class_name GameControl

var blockTscn = preload("res://table/block/block.tscn")
var blocks : Array[Block]

static var animeMutex:Mutex = Mutex.new()
@onready var player = $player

func block_ready():
	blocks.resize(24)
	for i in range(0,7) :
		var block = blockTscn.instantiate()
		block.position.x = 6*i
		add_child(block)
		blocks[i] = block
		block.set_num(i)
		
	for i in range(1,6):
		var block = blockTscn.instantiate()
		block.position.z = 6*i
		add_child(block)
		blocks[24-i] = block
		block.set_num(24-i)
		
	for i in range(1,6):
		var block = blockTscn.instantiate()
		block.position.x = 6*6
		block.position.z = 6*i
		add_child(block)
		blocks[6+i] = block
		block.set_num(6+i)
		
	for i in range(0,7) :
		var block = blockTscn.instantiate()
		block.position.x = 6*i
		block.position.z = 6*6
		add_child(block)
		blocks[18-i] = block
		block.set_num(18-i)	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	block_ready()
	
	pass # Replace with function body.

func mov_player_to(num:int):
	animeMutex.lock()
	player.walk_to(blocks[num].position)
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func click_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		for i in range(0, 24):
			if blocks[i].focused :
				mov_player_to(i)

func _process(delta: float) -> void:
	click_process(delta)
	pass
