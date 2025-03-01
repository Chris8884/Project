extends CharacterBody2D


class_name Player 


var cardinalDirection : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var stateMachine: PlayerStateMachine = $StateMachine


func _ready():
	stateMachine.Initialize(self)
	pass




func _process( delta ):
	
	#direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	#direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	direction = Vector2(
		Input.get_axis("left","right"),
		Input.get_axis("up","down")
	).normalized()
	
	pass




func _physics_process(delta):
	move_and_slide()



func SetDirection() -> bool:
	var newDir : Vector2 = cardinalDirection
	if direction == Vector2.ZERO:
		return false
		
	if direction.y == 0:
		newDir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT 
	elif direction.x == 0:
		newDir = Vector2.UP if direction.y < 0 else  Vector2.DOWN
	
	if newDir == cardinalDirection:
		return false
	
	cardinalDirection = newDir
	sprite.scale.x = -1 if cardinalDirection == Vector2.LEFT else 1
	return true 




func UpdateAnimation( state : String ) -> void:
	animation_player.play( state + "_" + AnimDirection() )
	pass



func AnimDirection() -> String:
	if cardinalDirection == Vector2.DOWN:
		return "down"
	elif cardinalDirection == Vector2.UP:
		return "up"
	else:
		return "side"
