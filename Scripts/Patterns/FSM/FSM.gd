extends Node

class_name FSM

@export var _initialState: State

var currentState: State

func _ready():
	InitializeCurrentState()

func InitializeCurrentState():
	if _initialState:
		currentState = _initialState
		currentState.Transitioned.connect(ChangeCurrentState)
		currentState.Enter()

func _process(delta):
	if currentState:
		currentState.Update(delta)

func ChangeCurrentState(nextState: State):
	if currentState:
		currentState.Exit()
	currentState = nextState
	currentState.Transitioned.connect(ChangeCurrentState)
	currentState.Enter()
