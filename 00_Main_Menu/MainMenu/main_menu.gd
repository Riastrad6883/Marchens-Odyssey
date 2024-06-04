class_name Menu extends Control

@onready var button_play : Button = $MarginContainer/HBoxContainer/VBoxContainer/PlayButton
@onready var button_new : Button = $MarginContainer/HBoxContainer/VBoxContainer/NewButton
@onready var button_load :  Button = $MarginContainer/HBoxContainer/VBoxContainer/LoadButton
@onready var button_settings : Button = $MarginContainer/HBoxContainer/VBoxContainer/SettingsButton
@onready var button_quit : Button = $MarginContainer/HBoxContainer/VBoxContainer3/QuitButton
@onready var camera_2d : Camera2D = $Camera2D

signal menu_change

func _ready() -> void:
	PlayerHud.hide()
	button_play.Pressed.connect(_on_play_pressed)
	button_new.Pressed.connect(_on_new_pressed)
	button_load.Pressed.connect(_on_load_pressed)
	button_settings.Pressed.connect(_on_settings_pressed)
	button_quit.Pressed.connect(_on_quit_pressed)
	#PlayerManager.player.get_child(player)
	#PlayerHud.player_hud.PROCESS_MODE_DISABLED
	pass

func _on_quit_pressed(_hurt_box : HurtBox) -> void:
	await get_tree().create_timer(0.8).timeout
	get_tree().quit()

func _on_load_pressed(_hurt_box : HurtBox) -> void:
	print("load pressed")
	await get_tree().create_timer(0.8).timeout
	
	menu_change.emit()
	pass


func _on_settings_pressed(_hurt_box : HurtBox) -> void:
	await get_tree().create_timer(0.8).timeout
	pass

func _on_new_pressed(_hurt_box : HurtBox) -> void:
	await get_tree().create_timer(0.8).timeout
	pass

func _on_play_pressed(_hurtbox : HurtBox) -> void:
	await get_tree().create_timer(0.8).timeout
	SaveManager.load_game()
	pass


