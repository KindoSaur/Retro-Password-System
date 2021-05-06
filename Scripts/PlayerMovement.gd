extends KinematicBody2D

export (int) var speed = 100

var velocity = Vector2()

onready var playerInfo = get_parent()
var canRaiseHealth = true
var canSubtractHealth = true

var canRaiseMoney = true
var canSubtractMoney = true

func _get_Input():
	velocity = Vector2()
	if(Input.is_action_pressed("ui_right")):
		velocity.x += 1
	if(Input.is_action_pressed("ui_left")):
		velocity.x -= 1
	if(Input.is_action_pressed("ui_up")):
		velocity.y -= 1
	if(Input.is_action_pressed("ui_down")):
		velocity.y += 1 
	
	velocity = velocity.normalized() * speed


func _physics_process(delta):
	_get_Input()
	velocity = move_and_slide(velocity)
	_get_Health_Input()
	_get_Coin_Input()


func _get_Health_Input():
	if(Input.is_action_just_pressed("add_health")):
		if(playerInfo.totalHealth == "AAF"):
			canRaiseHealth = false
		else:
			canRaiseHealth = true
		
		if(canRaiseHealth == true):
			playerInfo.healthU += 1
			if(playerInfo.healthU > 9):
				playerInfo.healthU = 0
				playerInfo.healthD += 1
				if(playerInfo.healthD > 9):
					playerInfo.healthD = 0
					playerInfo.healthH = 1
		
		playerInfo._check_Health()
	
	if(Input.is_action_just_pressed("subtract_health")):
		if(playerInfo.totalHealth == "BAF"):
			canSubtractHealth = false
		else:
			canSubtractHealth = true
	
		if(canSubtractHealth == true):
			playerInfo.healthU -= 1
			if(playerInfo.healthU < 0):
				playerInfo.healthU = 9
				playerInfo.healthD -= 1
				if(playerInfo.healthD < 0):
					playerInfo.healthD = 9
					playerInfo.healthH = 0 
		
		playerInfo._check_Health()

func _get_Coin_Input():
	if(Input.is_action_just_pressed("add_Coin")):
		if(playerInfo.totalCoinAmount == "49"):
			canRaiseMoney = false
		else:
			canRaiseMoney = true
		
		if(canRaiseMoney == true):
			playerInfo.coinsU += 1
			if(playerInfo.coinsU > 9):
				playerInfo.coinsU = 0
				playerInfo.coinsD += 1
		
		playerInfo._check_Coins_Amount()
	
	if(Input.is_action_just_pressed("subtract_Coin")):
		if(playerInfo.totalCoinAmount == "AF"):
			canSubtractMoney = false
		else:
			canSubtractMoney = true
		
		if(canSubtractMoney == true):
			playerInfo.coinsU -= 1
			if(playerInfo.coinsU < 0):
				playerInfo.coinsU = 9
				playerInfo.coinsD -= 1
		
		playerInfo._check_Coins_Amount()
