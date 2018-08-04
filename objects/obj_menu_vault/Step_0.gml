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

	menu_index = (menu_index + array_length_1d(menu_option)) mod array_length_1d(menu_option) //wrap menu index around its range

	if (_back) {
		with(instance_create(-GUI_WIDTH, 0, obj_menu_main)) {
			menu_index = 3	
		}
		active = false
	}

	if (_select) {
		switch (menu_index) {
			case 0: //settings
				active = false
				instance_create(-GUI_WIDTH, 0, obj_menu_settings)
			break;
			case 1: //replays
				//active = false		
			break;
			case 2: //album
				//active = false		
			break;
			case 3: //stats
				//active = false		
			break;
			case 4: //train
				//active = false
			break;
		}
	}
}