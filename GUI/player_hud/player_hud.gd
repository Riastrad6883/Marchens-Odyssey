extends CanvasLayer

var hearts : Array[HeartGUI] = []


@onready var player_hud : CanvasLayer = $"."

func _ready():
	get_viewport().set_input_as_handled()
	for c in $Control/HFlowContainer.get_children():
		if c is HeartGUI:
			hearts.append(c)
			c.visible = false
	
	
	pass 



func update_hp(_hp:int, _max_hp:int) -> void:
	update_max_hp(_max_hp)
	for i in _max_hp:
		update_heart(i, _hp)
	pass

func update_heart(_index:int, _hp:int) -> void:
	var _value : int = clampi(_hp - _index * 2, 0, 2)
	hearts[_index].value = _value
	pass

func update_max_hp(_max_hp : int) ->void:
	var _heart_count : int = roundi(_max_hp * 0.5)
	for i in hearts.size():
		if i < _heart_count:
			hearts[i].visible = true
		else:
			hearts[i].visible = false
	pass
