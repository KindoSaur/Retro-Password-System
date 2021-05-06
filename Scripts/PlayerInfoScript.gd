extends Node

var healthH = 0
var healthD = 0
var healthU = 0

var letterHealthH
var letterHealthD
var letterHealthU

var totalHealth

var coinsD = 0
var coinsU = 0

var letterCoinsD
var letterCoinsU

var totalCoinAmount

func _ready():
	pass
#	_check_Health()
#	_check_Coins_Amount()

func _check_Health():
	if(healthH == 1):
		letterHealthH = "A"
	elif(healthH == 0):
		letterHealthH = "B"
	
	if(healthD == 1):
		letterHealthD = "B"
	elif(healthD == 2):
		letterHealthD = "C"
	elif(healthD == 3):
		letterHealthD = "D"
	elif(healthD == 4):
		letterHealthD = "E"
	elif(healthD == 5):
		letterHealthD = 0
	elif(healthD == 6):
		letterHealthD = 1
	elif(healthD == 7):
		letterHealthD = 2
	elif(healthD == 8):
		letterHealthD = 3
	elif(healthD == 9):
		letterHealthD = 4
	else:
		letterHealthD = "A"
	
	if(healthU == 1):
		letterHealthU = "G"
	elif(healthU == 2):
		letterHealthU = "H"
	elif(healthU == 3):
		letterHealthU = "I"
	elif(healthU == 4):
		letterHealthU = "J"
	elif(healthU == 5):
		letterHealthU = "5"
	elif(healthU == 6):
		letterHealthU = "6"
	elif(healthU == 7):
		letterHealthU = "7"
	elif(healthU == 8):
		letterHealthU = "8"
	elif(healthU == 9):
		letterHealthU = "9"
	else:
		letterHealthU = "F"
	
	totalHealth = str(letterHealthH, letterHealthD, letterHealthU)
	print("Player Health = ", totalHealth)

func _check_Coins_Amount():
	if(coinsD == 1):
		letterCoinsD = "B"
	elif(coinsD == 2):
		letterCoinsD = "C"
	elif(coinsD == 3):
		letterCoinsD = "D"
	elif(coinsD == 4):
		letterCoinsD = "E"
	elif(coinsD == 5):
		letterCoinsD = "0"
	elif(coinsD == 6):
		letterCoinsD = "1"
	elif(coinsD == 7):
		letterCoinsD = "2"
	elif(coinsD == 8):
		letterCoinsD = "3"
	elif(coinsD == 9):
		letterCoinsD = "4"
	else:
		letterCoinsD = "A"
	
	if(coinsU == 1):
		letterCoinsU = "G"
	elif(coinsU == 2):
		letterCoinsU = "H"
	elif(coinsU == 3):
		letterCoinsU = "I"
	elif(coinsU == 4):
		letterCoinsU = "J"
	elif(coinsU == 5):
		letterCoinsU = "5"
	elif(coinsU == 6):
		letterCoinsU = "6"
	elif(coinsU == 7):
		letterCoinsU = "7"
	elif(coinsU == 8):
		letterCoinsU = "8"
	elif(coinsU == 9):
		letterCoinsU = "9"
	else:
		letterCoinsU = "F"
	
	totalCoinAmount = str(letterCoinsD, letterCoinsU)
	print("Coin Total = ", totalCoinAmount)
