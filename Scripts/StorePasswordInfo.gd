extends Node

var setCheckPoint = 0

var newPassword = [0,1,2,3,4]

var password = [0,1,2,3,4,5,6,7]
var currentSpot = 0

var fullHealthLock = false

func _store_Password(var level, var checkpoint, var difficulty, var currenthealth, var amountcollected):
	
	newPassword[0] = level
	newPassword[1] = checkpoint 
	newPassword[2] = difficulty
	newPassword[3] = currenthealth
	newPassword[4] = amountcollected
	
	print("Before you exit please write this password down: " , newPassword)

func _read_Password():
	if(password[0] == "A"): #Level 1
		if(password[1] == "A" || password[1] == "B" || password[1] == "C"): #CheckPoints
			if(password[2] == "E" || password[2] == "M" || password[2] == "H"): #Difficulty
				_check_Health_Player_Specifics()

	elif(password[0] == "B"): #Level 2
		if(password[1] == "A" || password[1] == "B"): #CheckPoints
			if(password[2] == "E" || password[2] == "M" || password[2] == "H"): #Difficulty
				_check_Health_Player_Specifics()

	elif(password[0] == "C"): #Level 3
		if(password[1] == "A" || password[1] == "B" || password[1] == "C" || password[1] == "D"): #CheckPoints
			if(password[2] == "E" || password[2] == "M" || password[2] == "H"): #Difficulty
				_check_Health_Player_Specifics()

func _check_Health_Player_Specifics():
	#Player Health
	if(password[3] == "A" && password[4] == "A" && password[5] == "F"):
		_check_Coin_Player_Specifics()
	elif(password[3] == "B"):
		print("Less than 100 health chosen")
		fullHealthLock = false
	else:
		print("Incorrect Health Input")
		fullHealthLock = true
		print("Locked")
	
	if(fullHealthLock == false):
		if(password[3] == "B" && 
		password[4] == "A" || password[4] == "B" || password[4] == "C" || password[4] == "D" || password[4] == "E" || password[4] == "0" || password[4] == "1" || password[4] == "2" || password[4] == "3" || password[4] == "4" &&
		password[5] == "F" || password[5] == "G" || password[5] == "H" || password[5] == "I" || password[5] == "J" || password[5] == "5" || password[5] == "6" || password[5] == "7" || password[5] == "8" || password[5] == "9"):
			_check_Coin_Player_Specifics()

	
	if(fullHealthLock == true):
		fullHealthLock = false
		print("Unlocked")

func _check_Coin_Player_Specifics():
	#Coins Collected
	if(password[6] == "A" || password[6] == "B" || password[6] == "C" || password[6] == "D" || password[6] == "E" || password[6] == "0" || password[6] == "1" || password[6] == "2" || password[6] == "3" || password[6] == "4" &&
	password[7] == "F" || password[7] == "G" || password[7] == "H" || password[7] == "I" || password[7] == "J" || password[7] == "5" || password[7] == "6" || password[7] == "7" || password[7] == "8" || password[7] == "9"):
		_load_Correct_Scene()

func _load_Correct_Scene():
	if(password[0] == "A"):
		get_tree().change_scene("res://Scenes/Level1.tscn")
	elif(password[0] == "B"):
		get_tree().change_scene("res://Scenes/Level2.tscn")
	elif(password[0] == "C"):
		get_tree().change_scene("res://Scenes/Level3.tscn")
