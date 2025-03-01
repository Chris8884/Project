extends State

class_name State_Attack

var attacking : bool = false 

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

@onready var walk: State = $"../Walk"
@onready var idle: State = $"../Idle"


func Enter() -> void:
	player.UpdateAnimation("attack")
	attacking = true 
	pass

func Exit() -> void:
	pass


func Process( _delta : float ) -> State:
	player.velocity = Vector2.ZERO
	return null



func Physics( _delta : float ) -> State:
	return null
	


func HandleInput ( _event : InputEvent ) -> State:
	return null

func EndAttack() -> void:
	attacking = false 
