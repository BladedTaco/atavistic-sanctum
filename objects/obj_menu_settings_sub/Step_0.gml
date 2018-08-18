/// @description control menu
if (creator.alarm[0] > 0) { //if moving between states
	if (creator.menu_index != creator.old_menu_index) {
		menu_index = 0
		if (creator.alarm[0] = MENU_DELAY) { //just moved
			active = false
			old_menu_index = menu_index
			alarm[0] = MENU_DELAY
		}
		if (active) {
			state = creator.menu_index
			x -= GUI_WIDTH/MENU_DELAY
			if (x <= GUI_WIDTH*0.5) {
				x = GUI_WIDTH*0.5
			}
		} else {
			x += GUI_WIDTH/MENU_DELAY
			if (x >= GUI_WIDTH) {
				active = true
			}
		}
	}
} else {
	//allow for text wrapping for states 1 and 2
	if (abs(y) < GUI_HEIGHT*0.1/MENU_DELAY) {
		y = 0
	} else {
		y += (GUI_HEIGHT*0.1/MENU_DELAY)*sign(-y)
	}
	x = creator.x + GUI_WIDTH*0.5
	var _select = false
	var _back = false
	if ((alarm[0] <= 0) and (creator.sub_menu)) {
		for (var i = 0; i < 8; i++) {
			if !(sub_menu) {
				if (abs(obj_input.input_array[i, YAXIS]) > 0.5) {
					menu_index += sign(obj_input.input_array[i, YAXIS])
					draw_count = 0
					alarm[0] = MENU_DELAY
					if (state < 2) {
						y += sign(obj_input.input_array[i, YAXIS])*GUI_HEIGHT*0.1	
					}
				}
			}
			if (state = 2) {
				if (abs(obj_input.input_array[i, XAXIS]) > 0.5) { //change rules
					if (sub_menu) {
						switch (menu_index) {
							case 0:
								global.stocks = max(global.stocks + sign(obj_input.input_array[i, XAXIS]), 0)
								alarm[0] = MENU_DELAY //make tiny menu delay
							break;
							case 1:
								global.time = max(global.time + sign(obj_input.input_array[i, XAXIS]), 0)
								alarm[0] = 4 //make tiny menu delay
							break;
						}
						menu_option[2, 0] = "STOCKS = " + string(global.stocks) //change default match rules
						if (global.time >= 60) { //set time description
							var _str = "Time = " + string(global.time div 60) + ":"
							if (global.time mod 60 < 10) {
								_str += "0"	
							}
							_str += string(global.time mod 60) + ":00"
							menu_option[2, 1] = _str
						} else {
							menu_option[2, 1] =  "TIME = " + string(global.time) + ":00"
						}
						if (global.stocks = 0) {
							menu_option[2, 0] = "STOCKS = INFINITE"
						}
						if (global.time = 0) {
							menu_option[2, 1] = "TIME = FOREVER"
						}
					}
				}
			} else if (state = 3) {
				if (abs(obj_input.input_array[i, XAXIS]) > 0.5) { //change sound levels
					if (sub_menu) {
						switch (menu_index) {
							case 0:
								global.sound = clamp(global.sound + sign(obj_input.input_array[i, XAXIS]), 0, 100)
							break;
							case 1:
								global.music = clamp(global.music + sign(obj_input.input_array[i, XAXIS]), 0, 100)
							break;
						}
						alarm[0] = 2 //make tiny menu delay
						menu_option[3, 0] = "SOUND = " + string(global.sound) + "%" //change global sound levels
						menu_option[3, 1] = "MUSIC = " + string(global.music) + "%" 
					}
				}
			}
			if (obj_input.input_array[i, ATTACK] and !obj_input.sticky_attack[i]) {
				obj_input.sticky_attack[i] = true
				_select = true
				alarm[0] = MENU_DELAY
			}
			if (obj_input.input_array[i, SPECIAL]) {
				if (sub_menu) {
					sub_menu = false
					alarm[0] = MENU_DELAY
				} else {
					_back = true
					alarm[0] = MENU_DELAY
				}
			}
		}
	}

	menu_index = (menu_index + array_length_2d(menu_option, state)) mod array_length_2d(menu_option, state) //wrap menu index around its range

	if (_back) {
		obj_menu_settings.sub_menu = false
		obj_menu_settings.alarm[0] = MENU_DELAY
		active = false
		if ((state = 2) or (state = 3)) {	
			var _file = file_text_open_write("rules.txt")
			file_text_write_real(_file, global.stocks); file_text_writeln(_file);
			file_text_write_real(_file, global.time); file_text_writeln(_file);
			file_text_write_real(_file, global.sound); file_text_writeln(_file);
			file_text_write_real(_file, global.music); file_text_writeln(_file);
			file_text_close(_file)
		}
	}

	if (_select) {
		switch (state) {
			case 0: case 1://names and controllers
				if (menu_index = array_length_2d(menu_option, state) - 2) { //deleting somthing
					if (menu_index = 0) {
						break; //dont allow deletion of nothing
					}
				}
				sub_menu = true
				with(instance_create(0, GUI_HEIGHT, obj_menu_profile)) {
					depth = other.depth - 1 //set to be above this menu
					state = other.state*3 //set state
					creator = other.id
					with (other) {
						if (menu_index < array_length_2d(menu_option, state) - 2) { //if not creating or deleting name
							other.name = menu_option[state, menu_index] //give name to handle
						} else {
							other.name = menu_option[state, menu_index] //clear name
							other.state += array_length_2d(menu_option, state) - menu_index  //set state to create or delete
						}
					}			
				}
			break;
			
			case 2: case 3: //rules and sound
				sub_menu = !sub_menu
			break;
			
			case 4: //debug
				global.debug = !global.debug
				show_debug_overlay(global.debug)
				if (global.debug) {
					menu_option[4, 0] = "DEBUG MODE IS\nON"
				} else {
					menu_option[4, 0] = "DEBUG MODE IS\nOFF"
				}
			break;
		}
	}
}