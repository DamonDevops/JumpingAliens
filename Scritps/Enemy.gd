extends Area2D

@export var move_speed :float = 30.0
@export var move_dir :Vector2

var start_position :Vector2
var end_position :Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position
	end_position = start_position + move_dir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(end_position, move_speed * delta)
	
	if global_position == end_position:
		if global_position == start_position:
			end_position = start_position + move_dir
		else:
			end_position = start_position


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.game_over()
