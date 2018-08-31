/// @description 
if (alarm[0] <= 0) {
	if (obj_input.input_array[0, SPECIAL]) {
		obj_menu_training.sub_menu = false
		instance_destroy();	
	}
	if (abs(obj_input.input_array[0, YAXIS]) > 0.5) {
		menu_index += sign(obj_input.input_array[0, YAXIS])
		menu_index = (menu_index + menu_length) mod menu_length
		alarm[0] = MENU_DELAY
	}
	if (abs(obj_input.input_array[0, XAXIS]) > 0.5) {
		sub_index = (sub_index + sign(obj_input.input_array[0, XAXIS]) + menu_width) mod menu_width
		alarm[0] = MENU_DELAY
	}
	if (obj_input.input_array[0, ATTACK]) {
		surface_free(menu_surface) //free the menu surface so it is re-drawn
		if !((state = 4) or (state = 2)) {
			name = menu_option[menu_index]
		}
		alarm[0] = MENU_DELAY
		switch (state) {
			case 0: //stage
				room_goto(asset_get_index("rm_match_" + string_replace(name, " ", "_"))) //goto the new stage
				obj_menu_training.menu_option[6] = "STAGE: " + name
			break;
			case 1: //player name
				obj_match_handler.player[0].name = name
				if (obj_input.controller[0]) {
					//add in control config here
					obj_menu_training.menu_option[1] = "NAME: " + name	
					scr_load_name(0, name)
				}
			break;
			case 2: //player character
				with (obj_match_handler.player[0]) {
					character = other.menu_index
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
			case 3: //cpu action
				obj_menu_training.cpu_action = menu_index
				obj_menu_training.menu_option[2] = "ACTION: " + name
				obj_menu_training.cpu_action = name
			break;
			case 4: //cpu character
				with (obj_match_handler.player[sub_index+1]) {
					character = other.menu_index
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