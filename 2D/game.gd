extends Control
class_name Game

@onready var cardPannel = $card_pannel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func add_card_to_hand(id):
	var card = preload("res://2D/card/card.tscn").instantiate()
	cardPannel.add_card(card)
	card.load_dic(id)
	return card

# Called every frame. 'delta' is the elapsed time since the previous frame.
var flag = false
var flag2 = false
var x
func _process(delta: float) -> void:
	if not flag :
		flag = true
		

		
		x = add_card_to_hand("1")
		add_card_to_hand("1")
	
	if Time.get_ticks_msec() > 20000 and not flag2:
		flag2 = true
		cardPannel.remove_card(x)
	
	pass
