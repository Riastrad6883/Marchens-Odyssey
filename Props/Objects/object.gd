class_name Asset_Object extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.Damaged.connect(TakeDamage)
	pass # Replace with function body.


func TakeDamage(_damage:HurtBox) -> void:
	queue_free()
	pass
