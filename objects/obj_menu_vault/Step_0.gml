/// @description control menu
if (!active) { //if inactive
	if (x < 0) { //if off the left side, move right into the screen until active at x = 0 
		x += GUI_WIDTH/15
		if (x >= 0) {
			x = 0
			active = true
		}
	} else { //otherwise move right off the screen until offscreen at which point destroy self
		x += GUI_WIDTH/15
		if (x > GUI_WIDTH) {
			instance_destroy();	
		}
	}
} else { //menu is active
	var _select = false
	var _back = false
	if (alarm[0] <= 0) { //if not during input delay
		for (var i = 0; i < 8; i++) { //for each possible player
			if (abs(obj_input.input_array[i, YAXIS]) > 0.5) { //if moving vertically
				//move mneu index by direction
				menu_index += sign(obj_input.input_array[i, YAXIS])
				draw_count = 0
				alarm[0] = MENU_DELAY
			}
			if (obj_input.input_array[i, XAXIS] > 0.5) { //if moving to the right
				//cause a selection
				_select = true
				alarm[0] = MENU_DELAY
			}
			if (obj_input.input_array[i, ATTACK]) { //if attacking
				//cause a selection
				_select = true
				alarm[0] = MENU_DELAY
			}
			if (obj_input.input_array[i, SPECIAL]) { //if specialing
				//cause a return
				_back = true
				alarm[0] = MENU_DELAY
			}
		}
	}

	menu_index = (menu_index + array_length_1d(menu_option)) mod array_length_1d(menu_option) //wrap menu index around its range

	if (_back) { //if trying to return
		//return to main menu with this menus option selected
		with(instance_create(-GUI_WIDTH, 0, obj_menu_main)) {
			menu_index = 3	
		}
		active = false
	}

	if (_select) { //if selecting
		switch (menu_index) {
			case 0: //settings
				//go to settings menu
				active = false
				instance_create(-GUI_WIDTH, 0, obj_menu_settings)
			break;
			case 1: //replays
				//go to replays menu
				active = false		
				instance_create(-GUI_WIDTH, 0, obj_menu_replay)
			break;
			case 2: //colours
				//this feature is coming soon and such has no current code
				//active = false		
			break;
			case 3: //stats
				//go to stats menu
				active = false	
				instance_create(-GUI_WIDTH, 0, obj_menu_stats)
			break;
			case 4: //train
				//begin to start a training match
				scr_start_training(false)
			break;
		}
	}
	if (room = rm_match_Training_Grounds) { //starting training
		//fully start training and become inactive
		scr_start_training(true)
		active = false
	}
}
