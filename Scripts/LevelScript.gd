extends Node

onready var playerInfo = get_node("Player")
onready var playerPos = get_node("Player/KinematicBody2D")

var arrayPos = 0

var pos0 = Vector2()
var pos1 = Vector2()
var pos2 = Vector2()
var pos3 = Vector2()

var levelLetter

var checkPointLetter

var setDifficultyLetter

func _ready():
	_decode_Password()
	
	levelLetter = storage.password[0]
	
	setDifficultyLetter = storage.password[2]

func _process(delta):
	if(Input.is_action_just_pressed("Quit")):
		print(storage._store_Password(levelLetter, checkPointLetter,setDifficultyLetter,playerInfo.totalHealth, playerInfo.totalCoinAmount))

func _decode_Password():
	#Load Specific Checkpoint in Level
	_find_Check_Points()
	if(storage.password[1] == "A"):
		print("CheckPoint 1 Loaded")
		playerPos.position = pos0
		print(playerPos.position)
	elif(storage.password[1] == "B"):
		print("CheckPoint 2 Loaded")
		playerPos.position = pos1
	elif(storage.password[1] == "C"):
		print("CheckPoint 3 Loaded")
		playerPos.position = pos2
	elif(storage.password[1] == "D"):
		print("CheckPoint 4 Loaded")
		playerPos.position = pos3

	#On What Difficulty 
	if(storage.password[2] == "E"):
		print("Level Set To Easy Mode")
	elif(storage.password[2] == "M"):
		print("Level Set To Medium Mode")
	elif(storage.password[2] == "H"):
		print("Level Set To Hard Mode")

	#How Much Health
	if(storage.password[3] == "A"):
		playerInfo.healthH = 1
	elif(storage.password[3] == "B"):
		playerInfo.healthH = 0
	
	if(storage.password[4] == "A"): playerInfo.healthD = 0
	elif(storage.password[4] == "B"): playerInfo.healthD = 1
	elif(storage.password[4] == "C"): playerInfo.healthD = 2
	elif(storage.password[4] == "D"): playerInfo.healthD = 3
	elif(storage.password[4] == "E"): playerInfo.healthD = 4
	elif(storage.password[4] == "0"): playerInfo.healthD = 5
	elif(storage.password[4] == "1"): playerInfo.healthD = 6
	elif(storage.password[4] == "2"): playerInfo.healthD = 7
	elif(storage.password[4] == "3"): playerInfo.healthD = 8
	elif(storage.password[4] == "4"): playerInfo.healthD = 9
	
	if(storage.password[5] == "F"): playerInfo.healthU = 0
	elif(storage.password[5] == "G"): playerInfo.healthU = 1
	elif(storage.password[5] == "H"): playerInfo.healthU = 2
	elif(storage.password[5] == "I"): playerInfo.healthU = 3
	elif(storage.password[5] == "J"): playerInfo.healthU = 4
	elif(storage.password[5] == "5"): playerInfo.healthU = 5
	elif(storage.password[5] == "6"): playerInfo.healthU = 6
	elif(storage.password[5] == "7"): playerInfo.healthU = 7
	elif(storage.password[5] == "8"): playerInfo.healthU = 8
	elif(storage.password[5] == "9"): playerInfo.healthU = 9

	playerInfo._check_Health()
	print("Player Starting Health At: ", playerInfo.healthH, playerInfo.healthD, playerInfo.healthU)

	# How Many Coins
	if(storage.password[6] == "A"): playerInfo.coinsD = 0
	elif(storage.password[6] == "B"): playerInfo.coinsD = 1
	elif(storage.password[6] == "C"): playerInfo.coinsD = 2
	elif(storage.password[6] == "D"): playerInfo.coinsD = 3
	elif(storage.password[6] == "E"): playerInfo.coinsD = 4
	elif(storage.password[6] == "0"): playerInfo.coinsD = 5
	elif(storage.password[6] == "1"): playerInfo.coinsD = 6
	elif(storage.password[6] == "2"): playerInfo.coinsD = 7
	elif(storage.password[6] == "3"): playerInfo.coinsD = 8
	elif(storage.password[6] == "4"): playerInfo.coinsD = 9
	
	if(storage.password[7] == "F"): playerInfo.coinsU = 0
	if(storage.password[7] == "G"): playerInfo.coinsU = 1
	if(storage.password[7] == "H"): playerInfo.coinsU = 2
	if(storage.password[7] == "I"): playerInfo.coinsU = 3
	if(storage.password[7] == "J"): playerInfo.coinsU = 4
	if(storage.password[7] == "5"): playerInfo.coinsU = 5
	if(storage.password[7] == "6"): playerInfo.coinsU = 6
	if(storage.password[7] == "7"): playerInfo.coinsU = 7
	if(storage.password[7] == "8"): playerInfo.coinsU = 8
	if(storage.password[7] == "9"): playerInfo.coinsU = 9
	
	playerInfo._check_Coins_Amount()
	print("Player Starting Coin Total At: ", playerInfo.coinsD, playerInfo.coinsU)

func _find_Check_Points():
	var checkPointPos = [0,1,2,3]
	
	for checkPointsInLevel in get_tree().get_nodes_in_group("CheckPointGroup"):
		var newArrayPos = arrayPos + 1
		checkPointPos[arrayPos] = checkPointsInLevel.position
		arrayPos = newArrayPos
	
	pos0 = checkPointPos[0]
	pos1 = checkPointPos[1]
	pos2 = checkPointPos[2]
	pos3 = checkPointPos[3]

func _on_Area2D_body_entered(body):
	checkPointLetter = "A"

func _on_Area2D2_body_entered(body):
	checkPointLetter = "B"

func _on_Area2D3_body_entered(body):
	checkPointLetter = "C"

func _on_Area2D4_body_entered(body):
	checkPointLetter = "D"
