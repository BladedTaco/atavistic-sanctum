/// @description control menu

if (!active) { //if inactive
	if (x < 0) { //if off the left side
		x += GUI_WIDTH/15 //move right
		if (x >= 0) { //if near centered
			x = 0 //center
			active = true //become active
		}
	} else { //if off the right side
		x += GUI_WIDTH/15 //move right
		if (x > GUI_WIDTH) { //if off screen
			instance_destroy();	 //destroy self
		}
	}
} else { //if active
	if (alarm[0] <= 0) { //check for input
		var _back = false
		for (var i = 0; i < global.player_number; i++) { //for each player
			if (abs(obj_input.input_array[i, YAXIS]) > 0.5) { //moving vertically
				menu_index += sign(obj_input.input_array[i, YAXIS]) //move menu option
				menu_index = (menu_index + menu_length) mod menu_length //wrap menu option
				alarm[0] = MENU_DELAY //set input delay
				event_user(0) //repopulate sub menu
			}
			if (obj_input.input_array[i, SPECIAL]) { //if wating to exit
				_back = true //cause an exit
				
			}
		}
		if (_back) { //if wanting to exit
			//return to the vault menu
			with(instance_create(-GUI_WIDTH, 0, obj_menu_vault)) {
				menu_index = 3
			}
			active = false //become inactive
		}
	}
}