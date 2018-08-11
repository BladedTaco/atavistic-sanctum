/// @description 
if (active = 1) {
	if (alarm[0] <= 0) {
		menu_index = (round(menu_index) + array_length_1d(menu_option)) mod array_length_1d(menu_option)
		if (abs(obj_input.input_array[player, YAXIS]) > 0.5) {
			alarm[0] = MENU_DELAY
			menu_direction = sign(obj_input.input_array[player, YAXIS])
		}
		if (obj_input.input_array[player, ATTACK]) {
			if (menu_index < array_length_1d(menu_option) - 2) { //last two names are not selectable
				name = menu_option[menu_index]
				active = 2
				obj_input.sticky_attack[player] = true
				if (obj_input.controller[player]) {
					scr_load_name(player, name)
				}
			}
		}
		if (obj_input.input_array[player, SPECIAL]) {
			active = 2
		}
	} else {
		menu_index += menu_direction/MENU_DELAY
	}
} else { //otherwise move menu to either initialise or destroy
	if (active < 1) {
		y -= GUI_HEIGHT*0.025
		if (y <= GUI_HEIGHT*0.75) {
			active = 1
			y = GUI_HEIGHT*0.75
		}
	} else {
		y += GUI_HEIGHT*0.025
		if (y >= GUI_HEIGHT) {
			obj_menu_char_select.sub_menu[player] = false
			obj_menu_char_select.name[player] = name
			instance_destroy();
		}
	}
}