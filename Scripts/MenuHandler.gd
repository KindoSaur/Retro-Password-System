extends Node

func _ready():
	for letter in get_tree().get_nodes_in_group("Letters"):
		letter.connect("pressed", self, "_on_Button_pressed", [letter.name])
	for number in get_tree().get_nodes_in_group("Numbers"):
		number.connect("pressed", self, "_on_Button_pressed", [number.name])
	for other in get_tree().get_nodes_in_group("Other"):
		other.connect("pressed", self, "_on_Other_pressed", [other.name])

#	print(storage.password[storage.currentSpot])

func _process(delta):
	if(storage.currentSpot < 0):
		storage.currentSpot = 0

func _on_Button_pressed(name):
	if(storage.currentSpot < $LineEdit.max_length):
		$LineEdit.text += name
		_add_To_Password(name)

func _on_Other_pressed(name):
	if(name == "Enter" && $LineEdit.text.length() == 8):
		storage._read_Password()
	elif(name == "Enter" && $LineEdit.text.length() != 8):
		print("Password Incomplete")
	
	if(name == "BackSpace"):
		$LineEdit.delete_char_at_cursor()
		_remove_From_Password(name)

func _add_To_Password(name):
	var newCurrentPosition = storage.currentSpot + 1
	storage.password[storage.currentSpot] = name
	storage.currentSpot = newCurrentPosition
	print(storage.password)

func _remove_From_Password(name):
	var newCurrentPosition = storage.currentSpot - 1
	storage.currentSpot = newCurrentPosition
	storage.password[storage.currentSpot] = null
	print(storage.password)
