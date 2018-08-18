/// @description control menu
if (room = rm_menu) {
	if (!active) {
		if (x < 0) {
			x += GUI_WIDTH/15
			if (x >= 0) {
				x = 0
				active = true
			}
		} else {
			x += GUI_WIDTH/15
			if (x > GUI_WIDTH) {
				instance_destroy();	
			}
		}
	} else {
		var _select = false
		var _back = false
		if ((alarm[0] <= 0) and (sub_menu != 2)) {
			for (var i = 0; i < 8; i++) {
				if (abs(obj_input.input_array[i, YAXIS]) > 0.5) {
					if (sub_menu = 1) { //in the sub menu
						sub_menu_index += sign(obj_input.input_array[i, YAXIS]) // move in sub menu
					} else { //normal menu
						menu_index += 3*sign(obj_input.input_array[i, YAXIS])	//move in real menu
					}
					alarm[0] = MENU_DELAY
				}
				if (abs(obj_input.input_array[i, XAXIS]) > 0.5) {
					if (!sub_menu) { //if not in sub menu
						menu_index += sign(obj_input.input_array[i, XAXIS])
						alarm[0] = MENU_DELAY
					}
				}
				if (obj_input.input_array[i, ATTACK]) {
					_select = true
					alarm[0] = MENU_DELAY
				}
				if (obj_input.input_array[i, SPECIAL]) {
					_back = true
					alarm[0] = MENU_DELAY
				}
			}
		}

		menu_index = (menu_index + menu_length) mod menu_length //wrap menu index around its range
		sub_menu_index = clamp(sub_menu_index, 0, 2) //clamp sub menu index

		if (_back) {
			if (sub_menu > 0) { //in the sub menu
				sub_menu = false
				sub_menu_index = 0
			} else { //return to vault menu
				with(instance_create(-GUI_WIDTH, 0, obj_menu_vault)) {
					menu_index = 1
				}
				active = false
			}
		}

		if (_select) { //handle menu option selection
			if (sub_menu > 0) {
				switch (sub_menu_index) {
					case 0: //play replay
						if (game_version[menu_index] = global.game_version) { //able to play replay
							//play replay	
							scr_start_replay(false)
						}
					break;
				
					case 1: //rename replay
						with (instance_create(GUI_WIDTH/2, GUI_HEIGHT/2, obj_menu_profile_sub)) {
							creator = other.id
							state = 2
							name = other.name[other.menu_index]
							depth = other.depth - 1
						}
						sub_menu = 2;
					break;
				
					case 2: //delete replay
						scr_delete_replay(name[menu_index])
						event_user(0) //repopulate and redraw menu
						sub_menu = 0
					break;
				}
			} else {
				if (game_version[menu_index] != "VERSIONLESS") { //selected a valid replay
					sub_menu = true
					sub_menu_index = 0
				}
			}
		}
	}
	if (alarm[1] > 0) {
		y = ((alarm[1]*alarm[1])/(GAME_SPEED*GAME_SPEED))*GUI_HEIGHT
	} else {
		y = 0	
	}
} else {
	if (!instance_exists(obj_match_handler)) {
		scr_start_replay(true) //create the players
	}
	alarm[1] += 2
	y = ((alarm[1]*alarm[1])/(GAME_SPEED*GAME_SPEED))*GUI_HEIGHT
	if (alarm[1] > GAME_SPEED) {
		instance_deactivate_object(obj_menu_replay);	
	}
}	
