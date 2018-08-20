/// @description get and handle inputs/ input buffer

if (instance_exists(obj_replay_handler) and obj_replay_handler.active) {
	scr_get_replay_input()
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

