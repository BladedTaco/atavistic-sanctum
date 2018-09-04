/// @description get and handle inputs/ input buffer

if (instance_exists(obj_replay_handler) and obj_replay_handler.active) { //if in a replay
	scr_get_replay_input() //get replay input
} else { //in a match or in training mode
	if (instance_exists(obj_menu_training)) { //training mode
		scr_get_input(0, controller[0], controller_number[0]) //get input from first player only
		if (obj_menu_training.visible = false) { //if the training menu isnt being used
			scr_training_cpu(obj_menu_training.cpu_action, obj_menu_training.cpu_index) //get the cpu inputs
		}
	} else { //normal match
		for (var i = 0; i < global.player_number; i++) { //for each player
			if (player_is_local[i]) { //if they are local
				scr_get_input(i, controller[i], controller_number[i]) //get their input
			} else { //if they are a non-local player (online player)
				scr_input_buffer_nonlocal(i) //handle their input buffer
			}
		}
	}
}

if ((room = rm_menu) or (instance_exists(obj_replay_handler) and !obj_replay_handler.active)) { //if in a menu room or a replay
	if (alarm[1] <= 0) { //alarm for input delay not active
		if (global.player_number < 8) { // if not at maximum players
			for (var i = 0; i < 12; i++) { //for each controller port
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
		if (keyboard_check_pressed(vk_anykey) and (global.player_number < 8)) { //if there is keyboard input
			for (var o = 0; o < global.player_number; o++) { //for each player
				if (controller[o] = false) { //if they are a keyboard player
					if (!(global.debug and keyboard_check(ord("Z")))) { //debug option to register all players are a single controller
						o = -1 // set o to below loop starting number
						break; // break the loop
					}
				}
			}
			if (o > -1) { //if the entire loop above executed, player isnt already connected
				scr_initialise_keyboard_inputs(o) //add the player
				global.player_number += 1 //increase player number
				player_is_local[o] = true; //set as local player
				controller[o] = false; //set as a keyboard player
				controller_number[o] = -1; //set to have no controller
			}
		}
	}
}
