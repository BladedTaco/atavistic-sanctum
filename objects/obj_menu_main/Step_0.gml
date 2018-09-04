/// @description control menu
if (!active) { //if inactive
	alarm[0] = MENU_DELAY
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
	if (alarm[0] <= 0) { //if not input delay
		for (var i = 0; i < 8; i++) { //for each possible player
			if (abs(obj_input.input_array[i, YAXIS]) > 0.5) { //if moving vertically
				//select the menu index above or below the current one based on direction
				menu_index += sign(obj_input.input_array[i, YAXIS])
				draw_count = 0
				alarm[0] = MENU_DELAY
			}
			if (obj_input.input_array[i, XAXIS] > 0.5) { //if moving right
				//cause a selection
				_select = true
				alarm[0] = MENU_DELAY
			}
			if (abs(obj_input.input_array[i, ATTACK]) > 0.5) { //if pressing attack
				//cause a selection
				_select = true
				alarm[0] = MENU_DELAY
			}
			if (abs(obj_input.input_array[i, SPECIAL]) > 0.5) { //if pressing special
				//cause a return
				_back = true
				alarm[0] = MENU_DELAY
			}
		}
	}

	menu_index = (menu_index + array_length_1d(menu_option)) mod array_length_1d(menu_option) //wrap menu index around its range

	if (_back) { //if exiting menu, go to last option
		menu_index = array_length_1d(menu_option) - 1	
	}

	if (_select) { //if a selection has been made
		switch (menu_index) { //handle selection
			case 0: //fight
				//go to character select menu
				active = false
				instance_create(-GUI_WIDTH,  0, obj_menu_char_select)				
			break;
			case 1: //online
				//go to online menu
				active = false
				instance_create(-GUI_WIDTH,  0, obj_menu_online)		
			break;
			case 2: //story
				//coming soon, code not yet implemented
				//active = false		
			break;
			case 3: //vault
				//go to vault menu
				active = false	
				instance_create(-GUI_WIDTH, 0, obj_menu_vault)
			break;
			case 4: //exit
				//if held long enough, end game
				alarm[1] += 2 //set exit alarm
				alarm[0] = -1 //remove input delay alarm
				if (alarm[1] > GAME_SPEED) {
					game_end()
				}
			break;
		}
	}
}