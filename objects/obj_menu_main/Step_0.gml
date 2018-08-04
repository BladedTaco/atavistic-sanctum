/// @description control menu
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
	if (alarm[0] <= 0) {
		for (var i = 0; i < 8; i++) {
			if (abs(obj_input.input_array[i, YAXIS]) > 0.5) {
				menu_index += sign(obj_input.input_array[i, YAXIS])
				draw_count = 0
				alarm[0] = MENU_DELAY
			}
			if (obj_input.input_array[i, XAXIS] > 0.5) {
				_select = true
				alarm[0] = MENU_DELAY
			}
			if (abs(obj_input.input_array[i, ATTACK]) > 0.5) {
				_select = true
				alarm[0] = MENU_DELAY
			}
			if (abs(obj_input.input_array[i, SPECIAL]) > 0.5) {
				_back = true
				alarm[0] = MENU_DELAY
			}
		}
	}

	menu_index = (menu_index + array_length_1d(menu_option)) mod array_length_1d(menu_option) //wrap menu index around its range

	if (_back) {
		menu_index = array_length_1d(menu_option) - 1	
	}

	if (_select) {
		switch (menu_index) {
			case 0: //fight
				active = false
				instance_create(-GUI_WIDTH,  0, obj_menu_char_select)				
			break;
			case 1: //online
				//active = false		
			break;
			case 2: //story
				//active = false		
			break;
			case 3: //vault
				active = false	
				instance_create(-GUI_WIDTH, 0, obj_menu_vault)
			break;
			case 4: //exit
				alarm[1] += 2 //set exit alarm
				alarm[0] = -1 //remove input delay alarm
				if (alarm[1] > GAME_SPEED) {
					game_end()
				}
			break;
		}
	}
}