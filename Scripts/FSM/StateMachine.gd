extends Node

class_name FSM

@export var initialState: State

var currentState: State

func _ready() -> void:
	_InitializeStartState()
	if currentState:
		currentState.Enter()

func _InitializeStartState() -> void:
	if initialState:
		currentState = initialState
		currentState.Transitioned.connect(ChangeState)

func ChangeState(newState: State) -> void:
	if currentState:
		currentState.Transitioned.disconnect(ChangeState)
		currentState.Exit()
	
	currentState = newState
	currentState.Transitioned.connect(ChangeState)
	currentState.Enter()

func _process(delta: float) -> void:
	if currentState:
		currentState.Update(delta)

func _physics_process(delta: float) -> void:
	if currentState:
		currentState.FixedUpdate(delta)
