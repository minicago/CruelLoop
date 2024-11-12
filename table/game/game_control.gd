extends Node3D
class_name GameControl

var blockTscn = preload("res://table/block/block.tscn")
var blocks : Array[Block]

@onready var player = $player
static var animePlaying = false
var action_list : Array[Dictionary]

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
	player.walk_to(blocks[num].position)
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func click_process(delta):
	if Input.is_action_just_pressed("click"):
		for i in range(0, 24):
			if blocks[i].focused :
				action_list.push_back({"type":"player_move","num":i})
				
func play_anime():
	animePlaying = true
	match( action_list[0].get("type","unknown") ):
		"player_move":
			mov_player_to(action_list[0].get("num",0))
		"unknown":
			print("unknown anime type error!")
	action_list.pop_front()
	

func anime_process(delta):
	if not animePlaying and not action_list.is_empty():
		play_anime()

func _process(delta: float) -> void:
	click_process(delta)
	anime_process(delta)
	pass
