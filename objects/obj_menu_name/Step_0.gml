/// @description control menu
if (active = 1) { // if active
	if (alarm[0] <= 0) { //if no input delay
		//wrap menu index
		menu_index = (round(menu_index) + array_length_1d(menu_option)) mod array_length_1d(menu_option)
		if (abs(obj_input.input_array[player, YAXIS]) > 0.5) { //moving vertically
			alarm[0] = MENU_DELAY //set input delay
			menu_direction = sign(obj_input.input_array[player, YAXIS]) //get menu direction of movement
		}
		if (obj_input.input_array[player, ATTACK]) { //attacking
			if (menu_index < array_length_1d(menu_option) - 2) { //last two names are not selectable
				if (array_length_1d(menu_option) = 3) { //no names made
					active = 2 //no name change for if there are no names made
				} else { //names are available
					name = menu_option[menu_index] //get the name
					active = 2 //make inactive
					obj_input.sticky_attack[player] = true //stop turbo input
					if (obj_input.controller[player]) { //if using a controller
						scr_load_name(player, name) //load the name 
					}
				}
			}
		}
		if (obj_input.input_array[player, SPECIAL]) { //specialing
			active = 2 //exit menu
		}
	} else { //input delay
		menu_index += menu_direction/MENU_DELAY //move menu index by menu direction
	}
} else { //otherwise move menu to either initialise or destroy
	if (active < 1) { //inactive
		y -= GUI_HEIGHT*0.025 //move up
		if (y <= GUI_HEIGHT*0.75) { //if at desired position
			active = 1 //make active
			y = GUI_HEIGHT*0.75 //stop moving
		}
	} else { //exiting
		y += GUI_HEIGHT*0.025 //move down
		if (y >= GUI_HEIGHT) { //if off screen
			//update character select menu and destroy self
			obj_menu_char_select.sub_menu[player] = false
			obj_menu_char_select.name[player] = name
			scr_update_network(3, player, name)
			instance_destroy();
		}
	}
}