/// @description 
if (!active) { //if inactive, set up menu
	switch (state) {
		case 0:	//default menu options
			menu_option[0] = "ATTACK"
			menu_option[1] = "SPECIAL"
			menu_option[2] = "JUMP"
			menu_option[3] = "PAUSE"
			menu_option[4] = "SHIELD"
			menu_option[5] = "GRAB"
			menu_option[6] = "TAUNT"
			menu_option[7] = "TILT"
			menu_option[8] = "NOTHING"
			menu_option[9] = "BACK"
			menu_length = 10
		break;
		case 1:	//c stick config
			menu_option[0] = "SMASH ATTACK"
			menu_option[1] = "TILT ATTACK"
			menu_option[2] = "SPECIAL ATTACK"
			menu_option[3] = "GRAB"
			menu_option[4] = "ROLL"
			menu_option[5] = "TAUNT"
			menu_option[6] = "JAB"
			menu_option[7] = "N-SPECIAL"
			menu_option[8] = "NOTHING"
			menu_option[9] = "BACK"
			menu_length = 10
		break;
		case 2:	//name entry
			for (var i = 0; i < 26; i++) {
				menu_option[i] = chr(ord("A") + i) //set letters
			}
			menu_option[26] = " "
			menu_option[27] = "<-"
			menu_option[28] = "->"
			menu_option[29] = "DEL"
			menu_option[30] = "CONFIRM"
			menu_length = 31
		break;
	}
	active = true
}

	if (alarm[0] <= 0) {
		var _select = false
		for (var i = 0; i < 8; i++) {
			if (obj_input.input_array[i, SPECIAL]) {
				instance_destroy();
				creator.sub_menu = false
				creator.alarm[0] = MENU_DELAY
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
			}
			if (abs(obj_input.input_array[i, XAXIS]) > 0.5) {
				if ((menu_index > menu_length - 7) and (sign(obj_input.input_array[i, XAXIS]) = 1)) { //moving off right edge
					if (menu_index = menu_length - 1) { //on last option
						menu_index += 6 //move right
					} else { //on last column
						menu_index = menu_length - 1//move to last option
					}
				} else if ((menu_index < 6) and (sign(obj_input.input_array[i, XAXIS]) = -1)) { //moving off left edge
					menu_index = menu_length - 1 //move to end option
				} else { //normal move
					menu_index += 6*sign(obj_input.input_array[i, XAXIS]) //move horizontally
				}
				alarm[0] = MENU_DELAY
			}
		}
		menu_index = (menu_index + menu_length) mod menu_length //wrap around menu
		
		if (_select) {
			switch (state) {
				case 0: //button type
					creator.sub_menu = false
					if (menu_index != 9) {
						creator.menu_option[creator.menu_index + 20] = menu_option[menu_index]
					}
					instance_destroy();
				break;
			}
		}
	}	