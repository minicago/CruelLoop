extends TextureButton
class_name Card_UI

@onready var image = $Image
@onready var nameLabel = $NameLabel
@onready var OPLabel = $OPLabel
var dic : Dictionary

const speed = 1000.0

var destion : Vector2

func load_dic(id):
	
	dic = Global.card_list[id]
	nameLabel.text = dic["name"]
	OPLabel.text = str(int(dic["OP"]))
	image.texture = load("res://resource/card/image/"+dic["file_name"]+".png")
	
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func move_process(delta):
	if position != destion :
		if (destion - position).length() < speed * delta :
			position = destion
			if(position.y <= -1000) : get_parent().remove_child(self)
		else :
			position += (destion - position).normalized() * speed * delta
			
func move_to(pos):
	destion = pos
		
func _process(delta: float) -> void:
	move_process(delta)
	pass
