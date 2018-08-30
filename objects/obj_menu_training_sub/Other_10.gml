/// @description initialise state

switch (state) {
	case 0: //stage
		//get stage sprites
		var i = 0
		var _str = -1;
		while (i <= room_last) { //loop until broken, or until there are no more rooms to check for
			_str = string_delete(room_get_name(rm_match_Ascent + i), 1, 9)
			if (_str = "d>") { //name is not <undefined>
				break; //break loop	
			}
			menu_option[i] = string_replace(_str, "_", " ")
			if (menu_option[i] = name) {
				menu_index = i	
			}
			i++
		}
		menu_length = i
		menu_surface = surface_create(GUI_WIDTH*0.25 + 1, GUI_HEIGHT*0.05*menu_length)
		x = GUI_WIDTH*0.025
		y = GUI_HEIGHT*0.75
	break;
	
	case 1: //name
		menu_option[0] = "P1"
		var i = 1
		//read names from file
		var _file = file_text_open_read("names.txt") //open names text file
		while (!file_text_eof(_file)) {	//while the file has text to read
			menu_option[i] = file_text_read_string(_file) //load names into menu
			if (name = menu_option[i]) {
				menu_index = i	
			}
			file_text_readln(_file);
			i++
		} 
		file_text_close(_file)
		menu_length = i
		menu_surface = surface_create(GUI_WIDTH*0.175 + 1, GUI_HEIGHT*0.05*menu_length)
		x = GUI_WIDTH*0.025
		y = GUI_HEIGHT*0.25
	break;
	
	case 2: //player character
		menu_option[0] = spr_bal_stock
		menu_option[1] = spr_mac_stock
		menu_option[2] = spr_geo_stock
		menu_option[3] = spr_eth_stock
		menu_index = obj_match_handler.player[0].character
		menu_length = 4
		menu_surface = surface_create(GUI_WIDTH*0.05 + 1, GUI_HEIGHT*0.05*menu_length)
		x = GUI_WIDTH*0.225
		y = GUI_HEIGHT*0.25
	break;
	
	case 3: //cpu action
		menu_option[0] = "IDLE"
		menu_option[1] = "MOVE"
		menu_option[2] = "FOLLOW"
		menu_option[3] = "MIMIC"
		menu_option[4] = "JUMP"
		menu_length = 5
		for (var i = 0; i < menu_length; i++) {
			if (name = menu_option[i]) {
				menu_index = i
				break;
			}
		}
		menu_surface = surface_create(GUI_WIDTH*0.175 + 1, GUI_HEIGHT*0.05*menu_length)
		x = GUI_WIDTH*0.025
		y = GUI_HEIGHT*0.35
	break;
	
	case 4: //cpu player
		menu_option[0] = spr_bal_stock
		menu_option[1] = spr_mac_stock
		menu_option[2] = spr_geo_stock
		menu_option[3] = spr_eth_stock
		menu_length = 4
		menu_width = global.player_number - 1
		menu_surface = surface_create(GUI_WIDTH*0.05*menu_width + 1, GUI_HEIGHT*0.05*menu_length)
		x = GUI_WIDTH*0.225
		y = GUI_HEIGHT*0.35
	break;
}

if (state != 4) { //not a multi-column menu
	//make sure menu index is visible
	while ((menu_index - menu_offset)*GUI_HEIGHT*0.05 < 0) {
		menu_offset -= 1;	
	}
	while (y + (menu_index - menu_offset + 1)*GUI_HEIGHT*0.05 > GUI_HEIGHT) {
		menu_offset += 1;	
	}
}

/* STATES
0 - STAGE
1 - NAME
2 - PLAYER
3 - CPU ACTION
4 - CPU PLAYER
