extends CharacterBody2D

@export var speed: float = 25.0
@export var walk_time: float = 1.5

var direction := -1   # começa indo PARA A ESQUERDA
var timer := 0.0

func _ready():
	_update_sprite_direction()


func _physics_process(delta):
	timer += delta

	velocity.x = direction * speed
	move_and_slide()

	if timer >= walk_time:
		direction *= -1
		timer = 0
		_update_sprite_direction()


func _update_sprite_direction():
	# Como o sprite original está virado para a ESQUERDA:
	if direction == -1:
		$texture.flip_h = false   # mantém virado para ESQUERDA
	else:
		$texture.flip_h = true    # vira para DIREITA
		
