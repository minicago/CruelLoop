extends Node
class_name Global

static var player_pos = 0
static var vp = 0

class Card :
	var tscn
	var id

class Build :
	var tscn
	var id
	
static var card_list : Dictionary

static var deck : Array
static var hand : Array
static var picked_card
static var build : Array[Array]

static func pick_card(card):
	if picked_card != null:
		picked_card.picked = false
	picked_card = card
	card.picked = true
		
	

static func save_to_file(path, content):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)

static func load_from_file(path : String):
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	return content

static func load_json(path, list) :
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir():
				var str = load_from_file(path + '/' + file_name)
				var dic = JSON.parse_string(str)
				dic["file_name"] = file_name.get_slice(".",0)
				list[dic.get("id",0)] = dic
				
				print(str(dic.get("id",0)) + " loaded")
				
			else : load_json(path + '/' + file_name, list)
			
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	

static func _static_init() -> void:
	print("load card")
	load_json("res://resource/card/json", card_list)
	print(card_list)
	pass
