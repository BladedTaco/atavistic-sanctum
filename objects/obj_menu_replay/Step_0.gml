/// @description control menu
if (room = rm_menu) { //if in a menu room
	if (!active) { //if inactive 
		if (x < 0) { //if off the left side
			x += GUI_WIDTH/15 //move right
			if (x >= 0) { //if near centered 
				x = 0 //center
				active = true //set to active
			}
		} else { //off the right side
			x += GUI_WIDTH/15 //move further right
			if (x > GUI_WIDTH) { //if off screen
				instance_destroy();	 //destroy self
			}
		}
	} else { //if active
		var _select = false
		var _back = false
		if ((alarm[0] <= 0) and (sub_menu != 2)) { //if no input delay and not in a sub sub menu
			for (var i = 0; i < 8; i++) { //for each player
				if (abs(obj_input.input_array[i, YAXIS]) > 0.5) { //if moving vertically
					if (sub_menu = 1) { //in the sub menu
						sub_menu_index += sign(obj_input.input_array[i, YAXIS]) // move in sub menu
					} else { //normal menu
						menu_index += 3*sign(obj_input.input_array[i, YAXIS])	//move in real menu
					}
					alarm[0] = MENU_DELAY
				}
				if (abs(obj_input.input_array[i, XAXIS]) > 0.5) { //moving horizontally
					if (!sub_menu) { //if not in sub menu
						menu_index += sign(obj_input.input_array[i, XAXIS]) //move menu index 
						alarm[0] = MENU_DELAY //set menu delay
					}
				}
				if (obj_input.input_array[i, ATTACK]) { //attacking
					_select = true //cause a selection
					alarm[0] = MENU_DELAY //set a menu delay
				}
				if (obj_input.input_array[i, SPECIAL]) { //specialing
					_back = true //cause an exit
					alarm[0] = MENU_DELAY //cause a menu delay
				}
			}
		}

		menu_index = (menu_index + menu_length) mod menu_length //wrap menu index around its range
		sub_menu_index = clamp(sub_menu_index, 0, 2) //clamp sub menu index

		if (_back) { //if wanting to exit
			if (sub_menu > 0) { //in the sub menu
				sub_menu = false //exit sub menu
				sub_menu_index = 0 //set base sub menu index
			} else { //return to vault menu
				with(instance_create(-GUI_WIDTH, 0, obj_menu_vault)) {
					menu_index = 1
				}
				active = false
			}
		}

		if (_select) { //handle menu option selection
			if (sub_menu > 0) { //in a sub menu
				switch (sub_menu_index) { //basd on selected option
					case 0: //play replay
						if (game_version[menu_index] = global.game_version) { //able to play replay
							//play replay	
							scr_start_replay(false)
							sub_menu = 2;
						}
					break;
				
					case 1: //rename replay
						//create a sub menu to rename replay
						with (instance_create(GUI_WIDTH/2, GUI_HEIGHT/2, obj_menu_profile_sub)) {
							creator = other.id
							state = 2
							name = other.name[other.menu_index]
							depth = other.depth - 1
						}
						sub_menu = 2; //set be be in a sub menu
					break;
				
					case 2: //delete replay
						scr_delete_replay(name[menu_index]) //delete replay
						event_user(0) //repopulate and redraw menu
						sub_menu = 0 //exit sub menu
					break;
				}
			} else { //normal menu
				if (game_version[menu_index] != "VERSIONLESS") { //selected a valid replay
					//handle the replays sub menu
					sub_menu = true
					sub_menu_index = 0
				}
			}
		}
	}
	if (alarm[1] > 0) { //if starting or ending replay
		//move down based on how close to 1 second the scrolling alarm is
		y = ((alarm[1]*alarm[1])/(GAME_SPEED*GAME_SPEED))*GUI_HEIGHT
	} else { //normal menu
		y = 0	//reset position
	}
} else { //match room
	if (!instance_exists(obj_match_handler)) { //match isnt fully started
		scr_start_replay(true) //create the players
	}
	alarm[1] += 2 //increase scrolling alarm
	y = ((alarm[1]*alarm[1])/(GAME_SPEED*GAME_SPEED))*GUI_HEIGHT //move down
	if (alarm[1] > GAME_SPEED) { //menu is offscreen
		instance_deactivate_object(obj_menu_replay); //deactivate this menu
	}
}	
