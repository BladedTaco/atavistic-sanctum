/// @description pause / unpause
if (paused >= 0) { //pause
	if (instance_exists(obj_replay_handler) and obj_replay_handler.active) {
		replay = true;
		menu_option[2] = "Take Control"
		menu_option[5] = "End Replay"
		if (instance_exists(obj_replay_handler)) {
			pause.input_array		= array_clone(obj_input.input_array)
		}
		pause.old_axis			= array_clone(obj_input.old_axis)
		pause.sticky_attack		= array_clone(obj_input.sticky_attack)
		pause.sticky_dodge		= array_clone(obj_input.sticky_dodge)
		pause.sticky_jump		= array_clone(obj_input.sticky_jump)
		pause.sticky_special	= array_clone(obj_input.sticky_special)
	} else {
		replay = false;
		menu_option[2] = "Input lag: 5 frame"
		menu_option[5] = "FORFEIT"
	}
	screen_save("PAUSE_SCREEN") //create the pause screen
	pause_sprite = sprite_add("PAUSE_SCREEN", 1, false, false, 0, 0)
	alarm[1] = MENU_DELAY
	instance_deactivate_all(true)
	instance_activate_object(obj_pause)
} else {
	file_delete("PAUSE_SCREEN") //delete the pause screen
	sprite_delete(pause_sprite)
	instance_activate_all()
	if (instance_exists(obj_replay_handler)) {
		instance_deactivate_object(obj_menu_replay)
		obj_input.input_array		= array_clone(pause.input_array)
	} else {
		instance_deactivate_object(obj_menu_char_select)
	}
	obj_input.sticky_attack		= array_clone(pause.sticky_attack)
	obj_input.sticky_dodge		= array_clone(pause.sticky_dodge)		
	obj_input.sticky_jump		= array_clone(pause.sticky_jump)		
	obj_input.sticky_special	= array_clone(pause.sticky_special)
	obj_input.old_axis			= array_clone(pause.old_axis)
}