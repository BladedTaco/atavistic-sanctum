/// @description 

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
	if (alarm[0] <= 0) { //check for input
		var _back = false
		for (var i = 0; i < global.player_number; i++) {
			if (abs(obj_input.input_array[i, YAXIS]) > 0.5) {
				menu_index += sign(obj_input.input_array[i, YAXIS])
				menu_index = (menu_index + menu_length) mod menu_length
				alarm[0] = MENU_DELAY
				event_user(0) //repopulate sub menu
			}
			if (obj_input.input_array[i, SPECIAL]) {
				_back = true
				
			}
		}
		if (_back) {
			with(instance_create(-GUI_WIDTH, 0, obj_menu_vault)) {
				menu_index = 3
			}
			active = false
		}
	}
}