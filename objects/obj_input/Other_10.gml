/// @description pause / unpause
if (paused >= 0) { //pause
	if (instance_exists(obj_replay_handler) and obj_replay_handler.active) { //if in a replay
		//set replay menu options
		replay = true;
		menu_option[2] = "Take Control"
		menu_option[5] = "End Replay"
		pause.input_array		= array_clone(obj_input.input_array) //clone input array
	} else { //if in a match
		//set menu options
		replay = false;
		menu_option[2] = "Input lag: 5 frame"
		menu_option[5] = "FORFEIT"
	}
	//clone the input helper arrays to the pause object
	pause.old_axis			= array_clone(obj_input.old_axis)
	pause.sticky_attack		= array_clone(obj_input.sticky_attack)
	pause.sticky_dodge		= array_clone(obj_input.sticky_dodge)
	pause.sticky_jump		= array_clone(obj_input.sticky_jump)
	pause.sticky_special	= array_clone(obj_input.sticky_special)
	 //create the pause screen
	screen_save("PAUSE_SCREEN")
	pause_sprite = sprite_add("PAUSE_SCREEN", 1, false, false, 0, 0)
	alarm[1] = MENU_DELAY //set the input delay alarm
	instance_deactivate_all(true) //deactivate all objects other than this object
	instance_activate_object(obj_pause) //reactivate pause object
} else { //unpausing
	//delete the pause screen
	file_delete("PAUSE_SCREEN") 
	sprite_delete(pause_sprite)
	instance_activate_all() //reactivate everything
	if (instance_exists(obj_replay_handler)) { //if in a replay
		instance_deactivate_object(obj_menu_replay) //deactivate replay menu
		obj_input.input_array		= array_clone(pause.input_array) //clone input array back to input object
	} else { //in a match
		instance_deactivate_object(obj_menu_char_select) //deactivate character select menu
	}
	//clone input helper arrays back to input object from pause object
	obj_input.sticky_attack		= array_clone(pause.sticky_attack)
	obj_input.sticky_dodge		= array_clone(pause.sticky_dodge)		
	obj_input.sticky_jump		= array_clone(pause.sticky_jump)		
	obj_input.sticky_special	= array_clone(pause.sticky_special)
	obj_input.old_axis			= array_clone(pause.old_axis)
}