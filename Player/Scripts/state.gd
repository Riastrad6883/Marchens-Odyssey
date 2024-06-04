class_name State extends Node

## Stores a reference to the player that this state belongs to
static var player: Player
static var state_machine : PlayerStateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func init() -> void:
	pass


##What happens when the player enters this state
func Enter() -> void:
	pass
	

func Exit() -> void:
	pass

##What happens during the _process update in this state
func Process(_delta:float) -> State:
	return null

##What happens during the _physics_process update in this state
func Physics(_delta:float) -> State:
	return null

##What happens with input events in this state
func HandleInput(_event: InputEvent) -> State:
	return null
