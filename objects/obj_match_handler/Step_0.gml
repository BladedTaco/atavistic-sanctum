/// @description control characters
old_axis = obj_input.old_axis
input_array = obj_input.input_array




if !(instance_exists(obj_replay_handler) or instance_exists(obj_menu_training)) { //dont record replay during a replay or training
	scr_record_replay() //record this frames inputs to replay file
} else if (instance_exists(obj_menu_training) and obj_menu_training.visible) { //menu is up 
	//clear inputs
	for (var i = 0; i < global.player_number; i++) {
		for (var o = 0; o <= TILT; o++) {
			input_array[i, o] = 0	
		}
	}
}

if (starting <= 0) { //if match is started
	scr_control_character() //control the characters
}
