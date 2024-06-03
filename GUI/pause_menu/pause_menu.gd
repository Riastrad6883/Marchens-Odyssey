extends CanvasLayer

signal shown
signal hidden


@onready var button_save : Button = $Control/VBoxContainer/Button_Save
@onready var button_load : Button = $Control/VBoxContainer/Button_Load
@onready var button_exit = $Control/VBoxContainer/Button_Exit
@onready var audio_stream_player : AudioStreamPlayer = $Control/AudioStreamPlayer

@onready var item_description = $Control/ItemDescription

var is_paused : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	hide_pause_menu()
	button_save.pressed.connect(_on_save_pressed)
	button_load.pressed.connect(_on_load_pressed)
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if is_paused == false:
			show_pause_menu()
		else:
			hide_pause_menu()
		get_viewport().set_input_as_handled()

func show_pause_menu() -> void:
	get_tree().paused = true
	visible = true
	is_paused = true
	shown.emit()

func hide_pause_menu() -> void:
	get_tree().paused = false
	visible = false
	is_paused = false
	hidden.emit()


func _on_save_pressed() -> void:
	if is_paused == false:
		return
	SaveManager.save_game()
	hide_pause_menu()
	pass

func _on_load_pressed() -> void:
	if is_paused == false:
		return
	SaveManager.load_game()
	await LevelManager.level_load_started
	hide_pause_menu()
	pass

func _on_exit_pressed() -> void:
	if is_paused == false:
		return
	SaveManager.save_game()
	await get_tree().create_timer(0.5).timeout
	
	
	get_tree().quit()
	

func update_item_description(new_text:String) -> void:
	item_description.text = new_text


func _on_button_exit_pressed():
	_on_exit_pressed()

func play_sound(sound : AudioStream) -> void:
	audio_stream_player.stream = sound
	audio_stream_player.play()
