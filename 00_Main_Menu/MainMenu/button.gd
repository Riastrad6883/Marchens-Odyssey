class_name Buttons extends Button

signal Pressed(hurt_box : HurtBox)
@onready var hit_box : HitBox = $HitBox

func _ready()-> void:
	hit_box.Damaged.connect(RecievedDamage)
	pass


func RecievedDamage(hurt_box : HurtBox) -> void:
	Pressed.emit(hurt_box)
