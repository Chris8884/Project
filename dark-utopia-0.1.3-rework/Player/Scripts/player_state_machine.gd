extends Node

class_name PlayerStateMachine 

var states : Array [ State ]
var prevState : State
var currentState : State

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED
	pass 



func _process(delta):
	ChangeState( currentState.Process( delta ) )
	pass

func _physics_process(delta):
	ChangeState( currentState.Physics( delta ) )
	pass


func _unhandle_input(event):
	ChangeState( currentState.HnadleInput( event ) )




func Initialize( _player : Player ) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
	
	if states.size() > 0:
		states[0].player = _player
		ChangeState( states [0] )
		process_mode = Node.PROCESS_MODE_INHERIT




func ChangeState(newState : State ) -> void:
	if newState == null || newState == currentState:
		return
	
	
	if currentState:
		currentState.Exit()
	
	
	prevState = currentState
	currentState = newState
	currentState.Enter()
