/// @description handle menu
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
			alarm[1] = MENU_DELAY
		break;
		case 3: //cnotroller settings
			menu_option[0] = "R STICK DEADZONE"
			menu_option[1] = "L STICK DEADZONE"
			menu_option[2] = "L STICK NEUTRAL"
			menu_option[3] = "SMASH MOVEMENT"
			menu_option[4] = "SMASH DEADZONE"
			menu_option[5] = "TRIGGER THRESHOLD"
			menu_option[6] = "CONFIRM"
			menu_length = 7
		break;
	}
	active = true
	if (state != 2) { //not making name
		//select the current menu option
		for (var i = 0; i < menu_length; i++) {
			if (sub_name = menu_option[i]) {
				menu_index = i
				break;
			}
		}
	}
}

if (alarm[0] <= 0) {
	var _select = false
	for (var i = 0; i < 8; i++) {
		if (obj_input.input_array[i, SPECIAL]) {
			if ((state = 2) and (string_length(string_replace(sub_name, "\b.\b", "|")) > 1)) { //remove character
				//remove cursor character
				if (string_pos("|", sub_name) = 0) {
					sub_name = string_replace(sub_name, "\b.\b", "|")	
				}
				sub_name = string_delete(sub_name, sub_index, 1)
				//move index back by one, and then delete character
				sub_index = clamp(sub_index - 1, 1, string_length(sub_name)+1)
				sub_name = string_delete(sub_name, sub_index, 1)
				sub_index = clamp(sub_index, 1, string_length(sub_name)+1)
				sub_name = string_insert("|", sub_name, sub_index) //reinsert cursor
				alarm[0] = MENU_DELAY*2
				menu_option[30] = "CONFIRM"
			} else { //exit menu
				instance_destroy();
				if (creator.object_index = obj_menu_replay) { //obj_menu_replay uses the keyboard menu
					creator.sub_menu = 1;
				} else {
					creator.sub_menu = false
				}
				creator.alarm[0] = MENU_DELAY
				alarm[0] = MENU_DELAY
			}
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
			if (state = 3) {
				switch (menu_index) {
					case 0: //r stick deadzone
						obj_input.c_stick_deadzone[creator.player_number] = clamp(obj_input.c_stick_deadzone[creator.player_number] + 0.01*sign(obj_input.input_array[i, XAXIS]), 0.01, 0.9)
					break;
					case 1: //l stick deadzone
						obj_input.l_stick_deadzone[creator.player_number] = clamp(obj_input.l_stick_deadzone[creator.player_number] + 0.01*sign(obj_input.input_array[i, XAXIS]), 0.01, 0.9)
					break;
					case 2: //l stick neutral zone
						obj_input.l_stick_neutral[creator.player_number] = clamp(obj_input.l_stick_neutral[creator.player_number] + 0.01*sign(obj_input.input_array[i, XAXIS]), 0.01, 0.95)
					break;
					case 3: //smash movement
						obj_input.smash[creator.player_number] = clamp(obj_input.smash[creator.player_number] + 0.01*sign(obj_input.input_array[i, XAXIS]), 0.01, 1)
					break;
					case 4: //smash deadzone
						obj_input.smash_deadzone[creator.player_number] = clamp(obj_input.smash_deadzone[creator.player_number] + 0.01*sign(obj_input.input_array[i, XAXIS]), 0.01, 0.99)
					break;
					case 5: //trigger threshold
						obj_input.trigger_threshold[creator.player_number] = clamp(obj_input.trigger_threshold[creator.player_number] + 0.01*sign(obj_input.input_array[i, XAXIS]), -1, 0.95)
					break;
				}
				alarm[0] = MENU_DELAY/2
			} else {
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
	}
	menu_index = (menu_index + menu_length) mod menu_length //wrap around menu
		
	if (_select) {
		switch (state) {
			case 0: //button type
			case 1: //c_stick type
				creator.sub_menu = false
				if (menu_index != 9) {
					creator.menu_option[creator.menu_index + 20] = menu_option[menu_index]
				}
				instance_destroy();
			break;
			case 2: //naming profile
				//remove cursor character
				if (string_pos("|", sub_name) = 0) {
					sub_name = string_replace(sub_name, "\b.\b", "|")	
				}
				sub_name = string_delete(sub_name, sub_index, 1)
				menu_option[30] = "CONFIRM" //reset last menu option as it may need to be
				if (menu_index < 27) { //add letter
					sub_name = string_insert(menu_option[menu_index], sub_name, sub_index)	
					sub_index = clamp(sub_index + 1, 1, string_length(sub_name)+1)
				} else if (menu_index < 29) { //move position
					sub_index = clamp(sub_index + sign(menu_index - 27.5), 1, string_length(sub_name)+1)
				} else if (menu_index = 29) { //delete
					sub_index = clamp(sub_index - 1, 1, string_length(sub_name)+1) //move index back by 1
					sub_name = string_delete(sub_name, sub_index, 1) //delete character
					sub_index = clamp(sub_index, 1, string_length(sub_name)+1) //clamp index to range
				} else { //confirm
					if (creator.object_index = obj_menu_replay) { //obj_menu_replay uses the keyboard menu
						if (!file_exists("replays/" + sub_name + ".txt")) { //new name
							//accept name and return to creator menu
							scr_rename_replay(creator.name[creator.menu_index], sub_name)
							with (creator) {
								name[menu_index] = other.sub_name
								alarm[0] = MENU_DELAY
								sub_menu = 1
								event_user(0) //repopulate and redraw menu
							}
							instance_destroy();
						} else { //name already taken
							menu_option[30] = "NAME ALREADY\nTAKEN"
						}
					} else { //normal action
						if (!file_exists("names/controls/" + sub_name + ".txt")) { //new name
							//accept name and return to creator menu
							creator.name = sub_name
							creator.alarm[0] = MENU_DELAY
							creator.sub_menu = false
							instance_destroy();
						} else { //name already taken
							menu_option[30] = "NAME ALREADY\nTAKEN"
						}
					}
					
				}
				sub_name = string_insert("|", sub_name, sub_index) //reinsert cursor
			break;
			case 3:
				if (menu_index = 6) { //confirm
					instance_destroy();
					creator.sub_menu = false
					creator.alarm[0] = MENU_DELAY
					alarm[0] = MENU_DELAY
				}
			break;
		}
	}
}	