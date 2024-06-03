class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle : State = $"../Idle"
@onready var attack : State = $"../Attack"

##What happens when the player enters this state
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass
	

func Exit() -> void:
	pass

##What happens during the _process update in this state
func Process(_delta:float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	
	return null

##What happens during the _physics_process update in this state
func Physics(_delta:float) -> State:
	return null

##What happens with input events in this state
func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	if _event.is_action_pressed("interact"):
		PlayerManager.interact_pressed.emit()
	return null
