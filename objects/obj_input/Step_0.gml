/// @description get and handle inputs/ input buffer

if (instance_exists(obj_replay_handler) and obj_replay_handler.active) {
	input_array = obj_replay_handler.input_array
	if (global.match_frame > 1) { //if not the first two frames
		for (var i = 0; i < global.player_number; i++) { //for each player
			old_axis[i, 0] = input_array[i, 0] //store old xaxis
			old_axis[i, 1] = input_array[i, 1] //store old yaxis
			//check for termination of sticky jump
			if (sticky_jump[i] and !input_array[i, JUMP]) {
				sticky_jump[i] = false
			}
			if (sticky_attack[i] and !input_array[i, ATTACK]) {
				sticky_attack[i] = false
			}
			if (sticky_special[i] and !input_array[i, SPECIAL]) {
				sticky_special[i] = false
			}
			//check for termination of sticky dodge
			if (sticky_dodge[i] and ((!input_array[i, SHIELD]) or
				(point_distance(0, 0, input_array[i, XAXIS], input_array[i, YAXIS])
				< l_stick_neutral[i]))) {
				sticky_dodge[i] = false
			}
		}
		for (var i = 0; i < array_height_2d(button_array); i++) {
			scr_get_input(i, controller[i], controller_number[i])
		}
	}
} else {
	for (var i = 0; i < global.player_number; i++) {
		if (player_is_local[i]) {
			scr_get_input(i, controller[i], controller_number[i])
		} else {
			scr_input_buffer_nonlocal(i)	
		}
	
	}
}

if ((room = rm_menu) or (instance_exists(obj_replay_handler) and !obj_replay_handler.active)) { //if in a menu room or a replay
	if (alarm[1] <= 0) {
		if (global.player_number < 8) {
			for (var i = 0; i < 12; i++) {
				if (gamepad_is_connected(i)) {
					//if the controller is not already a player		
					//check for input
					//if input found, register it as a new player
					for (var o = 0; o < global.player_number; o++) {
						if (controller_number[o] = i) {
							o = -1 //set o so that the below check never executes
							break; //break current loop
						}
					}
					if (o > -1) { //if the entire loop above executed, player isnt already connected
						if (scr_check_controller_active(i)) {
							scr_init_controller(o, i) //add the player
							scr_load_name(o, "Default")
							global.player_number += 1 //increase player number
							player_is_local[o] = true //set to local player
						}
					}
				}
			}
		}
		if (keyboard_check_pressed(vk_anykey) and (global.player_number < 8)) {
			for (var o = 0; o < global.player_number; o++) {
				if (controller[o] = false) {
					if (!(global.debug and keyboard_check(ord("Z")))) { //debug option to register all players are a single controller
						o = -1
						break;	
					}
				}
			}
			if (o > -1) { //if the entire loop above executed, player isnt already connected
				scr_initialise_keyboard_inputs(o) //add the player
				global.player_number += 1 //increase player number
				player_is_local[o] = true;
				controller[o] = false;
				controller_number[o] = -1;
			}
		}
	}
}

