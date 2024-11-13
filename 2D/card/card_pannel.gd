extends Panel
class_name Card_Pannel

@onready var hBox = $HBoxContainer 

var puppets : Dictionary

func add_card(card):
	var puppet = preload("res://2D/card/puppet.tscn").instantiate()
	puppets[card] = puppet
	#puppet.visible = false
	hBox.add_child(puppet)
	card.position.x = -400
	add_child(card)
	

func remove_card(card):
	hBox.remove_child(puppets[card])
	puppets.erase(card)
	card.move_to(Vector2(card.position.x,-2000))
	#remove_child(card)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for card in puppets:
		if card.picked :
			card.move_to(Vector2(948,64) - self.position)
		else :
			card.move_to(puppets[card].position)
	pass
