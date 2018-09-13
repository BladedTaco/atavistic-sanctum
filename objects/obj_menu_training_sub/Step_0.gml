/// @description handle menu
if (alarm[0] <= 0) { //if no input delay
	if (obj_input.input_array[0, SPECIAL]) { //if specialing
		obj_menu_training.sub_menu = false //exit creators sub menu
		instance_destroy();	 //destroy self
	}
	if (abs(obj_input.input_array[0, YAXIS]) > 0.5) { //if moving vertically
		menu_index += sign(obj_input.input_array[0, YAXIS]) //move menu indexes
		menu_index = (menu_index + menu_length) mod menu_length //wrap menu index
		alarm[0] = MENU_DELAY //set input delay
	}
	if (abs(obj_input.input_array[0, XAXIS]) > 0.5) { //if moving horizontally
		sub_index = (sub_index + sign(obj_input.input_array[0, XAXIS]) + menu_width) mod menu_width //move and wrap sub index
		alarm[0] = MENU_DELAY //set input delay
	}
	if (obj_input.input_array[0, ATTACK]) { //if attacking
		surface_free(menu_surface) //free the menu surface so it is re-drawn
		if !((state = 4) or (state = 2)) { //not a special state
			name = menu_option[menu_index] //return the menu options name as the new value
		}
		alarm[0] = MENU_DELAY //set input delay
		switch (state) { //based on state
			case 0: //stage
				room_goto(asset_get_index("rm_match_" + string_replace(name, " ", "_"))) //goto the new stage
				obj_menu_training.menu_option[6] = "STAGE: " + name //update menu text
			break;
			case 1: //player name
				obj_match_handler.player[0].name = name //update player name
				if (obj_input.controller[0]) { //if a controller
					//add in control config here
					scr_load_name(0, name) //apply profile config
				}
				obj_menu_training.menu_option[1] = "NAME: " + name	//update menu text
			break;
			case 2: //player character
				with (obj_match_handler.player[0]) { //with each player
					character = other.menu_index //set as the selected character
					//set jumps and shield
					max_jumps = 2
					if (character = MAC) { max_jumps = 0 }
					if (character = BAL) { max_jumps = 4 }
					shield_max_percentage = 30
					if (character = GEO) { shield_max_percentage = 50 }
					shield_percentage = shield_max_percentage
					sprite_index = scr_get_sprite(id, string_delete(sprite_get_name(sprite_index), 1, 8)) //change sprite
					//add in pallet surface here
				}
				obj_menu_training.menu_sprite[0] = menu_option[menu_index]
			break;
			case 3: //cpu action
				obj_menu_training.cpu_action = menu_index //set cpu action
				obj_menu_training.menu_option[2] = "ACTION: " + name //update menu text
				obj_menu_training.cpu_action = name //set cpu action again????????????????
			break;
			case 4: //cpu character
				with (obj_match_handler.player[sub_index+1]) { //with the selected cpu
					character = other.menu_index //change character
					//set jumps and shield
					max_jumps = 2
					if (character = MAC) { max_jumps = 0 }
					if (character = BAL) { max_jumps = 4 }
					shield_max_percentage = 30
					if (character = GEO) { shield_max_percentage = 50 }
					shield_percentage = shield_max_percentage
					sprite_index = scr_get_sprite(id, string_delete(sprite_get_name(sprite_index), 1, 8)) //change sprite
					//add in pallet surface here
				}
			break;
			default: break;
		}
	}
}

//make sure selected option is visible
while ((menu_index - menu_offset)*GUI_HEIGHT*0.05 < 0) {
	menu_offset -= 1;	
}
while (y + (menu_index - menu_offset + 1)*GUI_HEIGHT*0.05 > GUI_HEIGHT) {
	menu_offset += 1;	
}