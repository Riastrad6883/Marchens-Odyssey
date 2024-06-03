class_name Root extends Node


var data : Data
var node : Menu

func _ready() -> void:
	_display_main_menu()
	



func _display_main_menu() -> void:
	node = (
			(load("res://00_Main_Menu/MainMenu/main_menu.tscn") as PackedScene).instantiate() as Menu
		)
	
	get_node("%UserInterface").add_child(node)
	

func _display_load_menu() -> void:
	get_node("%UserInterface").remove_child(node)
	await get_tree().create_timer(0.1).timeout
	
	node = (
			(load("res://00_Main_Menu/MainMenu/load_menu.tscn") as PackedScene).instantiate() as Menu
		)
	
	get_node("%UserInterface").add_child(node)
	pass

func _clear_user_interface() -> void:
	var children : Array[Node] = get_node("%serInterface").get_children()
	
	for child : Node in children:
		child.queue_free()

