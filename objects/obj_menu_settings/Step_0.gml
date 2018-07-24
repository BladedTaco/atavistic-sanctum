/// @description control menu

if !(sub_menu) {
	if (!active) {
		if (x < 0) {
			x += GUI_WIDTH/15
			if (x >= 0) {
				x = 0
				active = true
			}
		} else {
			creator.x += GUI_WIDTH/15
			x += GUI_WIDTH/15
			if (x > GUI_WIDTH) {
				instance_destroy();	
				instance_destroy(creator);
			}
		}
	} else {
		if !(instance_exists(creator)) {
			creator = instance_create(x + GUI_WIDTH, y, obj_menu_settings_sub)	
			creator.depth = depth - 1
			creator.creator = id
			alarm[0] = MENU_DELAY*0.5
		}
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
			with(instance_create(-GUI_WIDTH, 0, obj_menu_vault)) {
				menu_index = 0	
			}
			active = false
		}

		if (_select) {
			switch (menu_index) {
				case 0: //names and profiles
					sub_menu = true
				break;
				case 1: //controllers
					sub_menu = true		
				break;
				case 2: case 3: //rules and sound
					sub_menu = true	
					creator.sub_menu = false
				break;
				case 4: //debug
					global.debug = !global.debug
					show_debug_overlay(global.debug)
					sub_menu = true
				break;
			}
		}
	}
}