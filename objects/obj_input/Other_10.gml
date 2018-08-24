/// @description pause / unpause
if (paused >= 0) { //pause
	show_debug_message("\nPAUSE\n")
	if (instance_exists(obj_replay_handler) and obj_replay_handler.active) {
		replay = true;
		menu_option[2] = "Take Control"
		menu_option[5] = "End Replay"
		obj_replay_handler.old_axis			= obj_input.old_axis
		obj_replay_handler.input_array		= obj_input.input_array
		obj_replay_handler.sticky_attack	= obj_input.sticky_attack
		obj_replay_handler.sticky_dodge		= obj_input.sticky_dodge
		obj_replay_handler.sticky_jump		= obj_input.sticky_jump
		obj_replay_handler.sticky_special	= obj_input.sticky_special
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
	show_debug_message("\nUNPAUSE\n")
	file_delete("PAUSE_SCREEN") //delete the pause screen
	sprite_delete(pause_sprite)
	instance_activate_all()
	if (instance_exists(obj_replay_handler)) {
		instance_deactivate_object(obj_menu_replay)
		obj_input.sticky_attack		= obj_replay_handler.sticky_attack	
		obj_input.sticky_dodge		= obj_replay_handler.sticky_dodge		
		obj_input.sticky_jump		= obj_replay_handler.sticky_jump		
		obj_input.sticky_special	= obj_replay_handler.sticky_special
		obj_input.input_array		= obj_replay_handler.input_array
		obj_input.old_axis			= obj_replay_handler.old_axis
		obj_replay_handler.wait = false
	} else {
		instance_deactivate_object(obj_menu_char_select)
	}
}