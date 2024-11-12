extends Node3D


var blockTscn = preload("res://table/block/block.tscn")
var blocks : Array[Block]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
