/// @description control menu
if (creator.alarm[0] > 0) { //if creator has input delay active
	if (creator.menu_index != creator.old_menu_index) { //if creator switched menu indices
		menu_index = 0 //rest menu index
		if (creator.alarm[0] = MENU_DELAY) { //just moved
			active = false //make inactive
			old_menu_index = menu_index //set last menu index
			alarm[0] = MENU_DELAY //set input delay
		}
		if (active) { //if active
			state = creator.menu_index //get state
			x -= GUI_WIDTH/MENU_DELAY //move left
			if (x <= GUI_WIDTH*0.5) { //if more than halfway off screen
				x = GUI_WIDTH*0.5 //become halfway off screen
			}
		} else { //if inactive
			x += GUI_WIDTH/MENU_DELAY //move right
			if (x >= GUI_WIDTH) { //if completely off screen
				active = true //become active
			}
		}
	}
} else { //handle menu
	//allow for text wrapping for states 1 and 2
	if (abs(y) < GUI_HEIGHT*0.1/MENU_DELAY) { //if near y = 0
		y = 0
	} else { //anywhere else
		y += (GUI_HEIGHT*0.1/MENU_DELAY)*sign(-y) //move towards y = 0
	}
	x = creator.x + GUI_WIDTH*0.5 //move with creator
	var _select = false
	var _back = false
	if ((alarm[0] <= 0) and (creator.sub_menu)) { //no input delay and menu is active
		for (var i = 0; i < 8; i++) { //for each possible player
			if !(sub_menu) { //if not in a sub menu
				if (abs(obj_input.input_array[i, YAXIS]) > 0.5) { //if moving vertically
					menu_index += sign(obj_input.input_array[i, YAXIS]) //move menu index by direction
					draw_count = 0 //reset draw count
					alarm[0] = MENU_DELAY //set input delay
					if (state < 2) { //if first 2 states
						y += sign(obj_input.input_array[i, YAXIS])*GUI_HEIGHT*0.1 //move menu in direction for scrolling effect
					}
				}
			}
			if (state = 2) { //if second state
				if (abs(obj_input.input_array[i, XAXIS]) > 0.5) { //change rules
					if (sub_menu) { //if in a sub menu
						switch (menu_index) { //based on menu index
							case 0: //stocks
								//change stocks
								global.stocks = max(global.stocks + sign(obj_input.input_array[i, XAXIS]), 0)
								alarm[0] = MENU_DELAY*0.5 //make small menu delay
							break;
							case 1: //time
								//change time
								global.time = max(global.time + sign(obj_input.input_array[i, XAXIS]), 0)
								alarm[0] = 4 //make tiny menu delay
							break;
						}
						menu_option[2, 0] = "STOCKS = " + string(global.stocks) //update menu option text
						if (global.time >= 60) { //timer set for an hour or more
							var _str = "Time = " + string(global.time div 60) + ":" //write hours
							if (global.time mod 60 < 10) { //if minutes compoenent is less than 10
								_str += "0"	//add a 0
							}
							_str += string(global.time mod 60) + ":00" //write minutes and seconds
							menu_option[2, 1] = _str //update menu option text
						} else { //timer set for less than an hour
							menu_option[2, 1] =  "TIME = " + string(global.time) + ":00" //update menu option text
						}
						if (global.stocks = 0) { //stockless
							menu_option[2, 0] = "STOCKS = INFINITE" //update menu option text
						}
						if (global.time = 0) { //timeless
							menu_option[2, 1] = "TIME = FOREVER" //update menu option text
						}
					}
				}
			} else if (state = 3) { //if third state of menu
				if (abs(obj_input.input_array[i, XAXIS]) > 0.5) { //change sound levels
					if (sub_menu) { //if in a sub menu
						switch (menu_index) { //based on menu index
							case 0: //sound
								//change sound levels
								global.sound = clamp(global.sound + sign(obj_input.input_array[i, XAXIS]), 0, 100)
							break;
							case 1: //music
								//change music levels
								global.music = clamp(global.music + sign(obj_input.input_array[i, XAXIS]), 0, 100)
							break;
						}
						alarm[0] = 2 //make tiny menu delay
						//update menu option texts
						menu_option[3, 0] = "SOUND = " + string(global.sound) + "%" 
						menu_option[3, 1] = "MUSIC = " + string(global.music) + "%" 
					}
				}
			}
			if (obj_input.input_array[i, ATTACK] and !obj_input.sticky_attack[i]) { //if selecting an option
				obj_input.sticky_attack[i] = true //prevent turbo inputs
				_select = true //cause a selection
				alarm[0] = MENU_DELAY //set input delay
			}
			if (obj_input.input_array[i, SPECIAL]) { //wanting to go back 
				if (sub_menu) { //if in a sub menu
					sub_menu = false //leave the sub menu
					alarm[0] = MENU_DELAY //set an input delay
				} else { //in the normal menu
					_back = true //cause an exit
					alarm[0] = MENU_DELAY //set an input delay
				}
			}
		}
	}

	menu_index = (menu_index + array_length_2d(menu_option, state)) mod array_length_2d(menu_option, state) //wrap menu index around its range

	if (_back) { //if wanting to exit
		//give control back to creator menu
		obj_menu_settings.sub_menu = false
		obj_menu_settings.alarm[0] = MENU_DELAY
		active = false //become inactive
		if ((state = 2) or (state = 3)) { //if changing global game constants
			//write the new values into the rules file for later reading
			var _file = file_text_open_write("rules.txt") //open file
			//write values
			file_text_write_real(_file, global.stocks); file_text_writeln(_file);
			file_text_write_real(_file, global.time); file_text_writeln(_file);
			file_text_write_real(_file, global.sound); file_text_writeln(_file);
			file_text_write_real(_file, global.music); file_text_writeln(_file);
			file_text_close(_file) //close file
		}
	}

	if (_select) { //if wanting to select a menu option
		switch (state) { //based on state
			case 0: case 1://names and controllers
				if (menu_index = array_length_2d(menu_option, state) - 2) { //deleting somthing
					if (menu_index = 0) { 
						break; //dont allow deletion of nothing
					}
				}
				sub_menu = true //give control to sub menu
				//create and initialise the profile menu
				with(instance_create(0, GUI_HEIGHT, obj_menu_profile)) {
					depth = other.depth - 1 //set to be above this menu
					state = other.state*3 //set state
					creator = other.id //give it its creator as the outside menu
					with (other) { //with the original menu
						if (menu_index < array_length_2d(menu_option, state) - 2) { //if not creating or deleting name
							other.name = menu_option[state, menu_index] //give name to handle
						} else { //editing a name
							other.name = menu_option[state, menu_index] //clear name
							other.state += array_length_2d(menu_option, state) - menu_index  //set state to create or delete
						}
					}			
				}
			break;
			
			case 2: case 3: //rules and sound
				sub_menu = !sub_menu //toggle sub menu control
			break;
			
			case 4: //debug
				global.debug = !global.debug //toggle debug mode
				show_debug_overlay(global.debug) //toggle debug overlay
				//update menu option text
				if (global.debug) {
					menu_option[4, 0] = "DEBUG MODE IS\nON"
				} else {
					menu_option[4, 0] = "DEBUG MODE IS\nOFF"
				}
			break;
		}
	}
}