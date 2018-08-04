/// @description 
if (instance_exists(creator)) {
	creator.alarm[0] = MENU_DELAY	
}
if (active = 1) {
	
	if ((state != 2) and (state != 5)) {
		//get input for used controller
		if (gamepad_is_connected(controller)) {
			for (var i = 0; i < 20; i++) {
				if (i < 14 + obj_input.analogue[player_number]) { //button
					input_array[i] = gamepad_button_check(controller, obj_input.button_const_array[player_number, i])
				} else if (i < 16) { //analogue button
					input_array[i] = gamepad_axis_value(controller, obj_input.button_const_array[player_number, i])*obj_input.axis[player_number, i-10]
				} else { //directional stick
					input_array[i] = gamepad_axis_value(controller, obj_input.button_const_array[player_number, i])*obj_input.axis[player_number, i-16]
				}
			}
		} else {
			for (var i = 0; i < 12; i++) {
				if (gamepad_is_connected(i)) {
					if (gamepad_button_check(i, gp_face1)) {
						controller = i	
					}
				}
			}
		}
	}
	
	if ((alarm[0] <= 0) and (!sub_menu)) {
		//do stuff 	
		var _select = false
		for (var i = 0; i < 8; i++) {
			if (obj_input.controller_number[i] != controller) {
				if (obj_input.input_array[i, SPECIAL]) {
					active = 2
					alarm[0] = MENU_DELAY
				}
				if (obj_input.input_array[i, ATTACK] and !obj_input.sticky_attack[i]) {
					_select = true
					alarm[0] = MENU_DELAY
					obj_input.sticky_attack[i] = true
				}
				if (abs(obj_input.input_array[i, YAXIS]) > 0.5) {
					menu_index += sign(obj_input.input_array[i, YAXIS])	
					alarm[0] = MENU_DELAY
					menu_index = (menu_index + menu_length) mod menu_length //wrap around menu
					while (menu_option[menu_index] = "\b") {
						menu_index = (menu_index + menu_length + sign(obj_input.input_array[i, YAXIS])) mod menu_length //wrap around menu
					}
				}
				if (abs(obj_input.input_array[i, XAXIS]) > 0.5) {
					menu_index += 10*sign(obj_input.input_array[i, XAXIS])	
					alarm[0] = MENU_DELAY
					menu_index = (menu_index + menu_length) mod menu_length //wrap around menu
					while (menu_option[menu_index] = "\b") {
						menu_index = (menu_index + menu_length + sign(obj_input.input_array[i, XAXIS])) mod menu_length //wrap around menu
					}
				}
			}
		}
		menu_index = (menu_index + menu_length) mod menu_length //wrap around menu
		if (_select) {
			switch (state) {
				case 0: //handle a name
				break;
				case 1: //add a name
					if (menu_index < menu_length - 1) { //selecting an option
						sub_menu = true
						with (instance_create(GUI_WIDTH/2, GUI_HEIGHT/2, obj_profile_menu_sub)) {
							creator = other.id	
							if (other.menu_index = 17) { //r stick
								state = 1 //c stick state
							} else if (other.menu_index = 18) { //name
								state = 2 //name entry state
							} else {
								state = 0 //default state
							}
							depth = other.depth - 1
							name = other.menu_option[other.menu_index]
						}
					} else {
						//add name	
						scr_add_name(sub_name)
					}
				break;
				case 3: //handle a controller
				break;
				case 4: //add a controller
					alarm[1] = GAME_SPEED*3
					sub_menu = true
					scr_add_controller(name)
				break;
				case 2: //delete a name
				case 5: //delete a controller
					if (menu_index = array_length_1d(menu_option) - 1) { //last option selected
						menu_index = 19 //go to first page
					} else {
						if (menu_index mod 10 != 9) { //name selected
							if (state = 5) {
								scr_remove_name(1, menu_option[menu_index]) //delete controller
							} else {
								scr_remove_name(0, menu_option[menu_index]) //delete name
							}
							menu_option[menu_index] = "SUCCESSFULLY DELETED.\b"  //set option text
						} else { //page moving selected
							if (menu_index mod 20 < 10) { //previous page
								menu_index -= 20 //move to previous page
								if (menu_index < 0) {
									menu_index = (menu_length div 20)*20 - 11
								}
							} else { //next page
								menu_index += 20 //move to next page
								if (menu_index > menu_length) {
									if (menu_index = menu_length + 19) { //moving to first page
										menu_index = 19
									} else { //moving to last page
										menu_index = menu_length - 11
									}
								}
							}
						}
					}
				break;
			}
		}
	}
} else {
	if (active < 1) {
		y = GUI_HEIGHT*alarm[0]/(GAME_SPEED*0.25)
		if (active = 0) {
			//intial menu set up
			switch (state) {
				case 0: //handle a name
				case 1: //add a name
					menu_option[20] = "ATTACK"	
					menu_option[21] = "SPECIAL"	
					menu_option[22] = "JUMP"	
					menu_option[23] = "JUMP"		
					menu_option[24] = "SHIELD"	
					menu_option[25] = "SHIELD"	
					menu_option[26] = "PAUSE"		
					menu_option[27] = "PAUSE"		
					menu_option[28] = "SHIELD"			
					menu_option[29] = "SHIELD"			
					menu_option[30] = "TAUNT"	
					menu_option[31] = "TAUNT"	
					menu_option[32] = "TAUNT"	
					menu_option[33] = "TAUNT"	
					menu_option[34] = "SHIELD"
					menu_option[35] = "SHIELD"
					menu_option[36] = "MOVE"
					menu_option[37] = "SMASHES"
					menu_option[38] = "NAME"
					menu_option[39] = "CONFIRM"
				case 3: //handle a controller
				case 4: //add a controller
					menu_option[0] = "FACE DOWN (A)"	
					menu_option[1] = "FACE RIGHT (B)"	
					menu_option[2] = "FACE LEFT (X)"	
					menu_option[3] = "FACE UP (Y)"		
					menu_option[4] = "L-BUMPER (L1)"	
					menu_option[5] = "R-BUMPER (R1)"	
					menu_option[6] = "SELECT (SL)"		
					menu_option[7] = "START (ST)"		
					menu_option[8] = "L-STICK (L3)"			
					menu_option[9] = "R-STICK (R3)"			
					menu_option[10] = "D-PAD UP (DU)"	
					menu_option[11] = "D-PAD DOWN (DD)"	
					menu_option[12] = "D-PAD LEFT (DL)"	
					menu_option[13] = "D-PAD RIGHT (DR)"	
					menu_option[14] = "R-TRIGGER (R2)"
					menu_option[15] = "L-TRIGGER (L2)"
					menu_option[16] = "L-STICK X (LX)"	
					menu_option[17] = "L-STICK Y (LY)"	
					menu_option[18] = "R-STICK X (RX)"	
					menu_option[19] = "R-STICK Y (RY)"	
					for (var i = 0; i < 20; i++) {
						input_array[i] = 0	
					}
					if (state < 3) {
						menu_option[16] = "L-STICK (LS)"
						menu_option[17] = "R-STICK (RS)"
						menu_option[18] = ""
						menu_option[19] = ""
					} else if (state = 3) { //handling a contorller
						menu_option[20] = "ACCEPT"	
						menu_length = 21;
					}
				break;
				
				case 2: //delete a name
					var _file = file_text_open_read("names.txt") //open a file
				case 5: //delete a controller
					if (state = 5) { //if this state, open a file
						var _file = file_text_open_read("controllers.txt")
					}
					var i = 0;
					//read the menu options from the file
					while (!file_text_eof(_file)) {
						if (i mod 10 = 9) { //add in a page mover at the bottom of each column
							if (i mod 20 < 10) {
								menu_option[i] = "PREVIOUS PAGE"
							} else {
								menu_option[i] = "NEXT PAGE"
							}
						} else {
							menu_option[i] = file_text_read_string(_file);
							file_text_readln(_file);
							if (menu_option[i] = "Default") {
								menu_option[i] = file_text_read_string(_file);
								file_text_readln(_file);
							}
						}
						i++
					}
					//add special case menu options
					menu_option[9] = "LAST PAGE"
					if (i mod 20 < 9) {
						while (i mod 20 < 9) {
							menu_option[i] = "\b"
							i++
						} 
						menu_option[i] = "PREVIOUS PAGE"
						i++
					}
					if (i mod 20 < 19) {
						while (i mod 20 < 19) {
							menu_option[i] = "\b"
							i++
						} 
					}
					menu_option[i] = "FIRST PAGE"		
					menu_length = array_length_1d(menu_option)
					file_text_close(_file) //close the file
				break;
			}
			active = 0.5
		}
		if (y <= 0) {
			y = 0
			active = 1
		}
	} else {
		y += GUI_HEIGHT/(GAME_SPEED*0.25)
		if (y >= GUI_HEIGHT) {
			creator.sub_menu = false
			instance_destroy();
			with (creator) { //repopulate creator menu
				menu_option = [] //clear the menu options
				event_user(0) //call the menu population event
				if (other.state mod 3 != 0) {
					if (other.state < 3) {
						menu_index = array_length_2d(menu_option, 0) - other.state
					} else {
						menu_index = array_length_2d(menu_option, 1) - other.state + 3
					}
				}
			}
		}
	}
}