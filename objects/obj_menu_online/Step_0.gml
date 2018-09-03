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
		var _select = false
		for (var i = 0; i < global.player_number; i++) {
			if (abs(obj_input.input_array[i, XAXIS]) > 0.5) {
				menu_index += sign(obj_input.input_array[i, XAXIS])
				menu_index = (menu_index + menu_length) mod menu_length
				alarm[0] = MENU_DELAY
			}
			if (obj_input.input_array[i, SPECIAL]) {
				_back = true
				alarm[0] = MENU_DELAY
			}
			if (obj_input.input_array[i, ATTACK]) {
				_select = true
				alarm[0] = MENU_DELAY
			}
		}
		if (_back) {
			with(instance_create(-GUI_WIDTH, 0, obj_menu_main)) {
				menu_index = 1
			}
			active = false
		} else if (_select) {
			switch (menu_index) {
				case 0: //host
					global.network_ip = "127.0.0.1"
					instance_create(0, 0, obj_server)
					instance_create(0, 0, obj_client)
					instance_create(-GUI_WIDTH, 0, obj_menu_char_select)
					active = false
				break;
				
				case 1: //join
					sub_menu = true
					global.network_ip = get_string("Enter the ip to connect to:\nNOTE: must be port-forwarded or on the same network", "") 
					instance_create(0, 0, obj_client)
					alarm[0] = GAME_SPEED*3
				break;
			}
		}
	}
}