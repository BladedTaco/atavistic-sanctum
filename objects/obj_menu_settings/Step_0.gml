/// @description control menu

if !(sub_menu) { //if not in a sub menu
	if (!active) { //if inactive
		if (x < 0) { //if off the left side
			x += GUI_WIDTH/15 //move right
			if (x >= 0) { //if fully on screen
				x = 0 //set position
				active = true //make active
			}
		} else { //if centred or off the right side
			creator.x += GUI_WIDTH/15 //move sub menu right
			x += GUI_WIDTH/15 //move right
			if (x > GUI_WIDTH) { //if off the right side fully
				instance_destroy();	 //destroy self
				instance_destroy(creator); //destroy sub menu
			}
		}
	} else { //if active
		if !(instance_exists(creator)) { //if there is no sub menu yet
			creator = instance_create(x + GUI_WIDTH, y, obj_menu_settings_sub) //create sub menu
			creator.depth = depth - 1 //set its depth above this menus
			creator.creator = id //set its creator as this menu
			alarm[0] = MENU_DELAY*0.5 //set an input delay
		}
		var _select = false
		var _back = false
		if (alarm[0] <= 0) { //if not input delay
			for (var i = 0; i < 8; i++) { //for each possible player
				if (abs(obj_input.input_array[i, YAXIS]) > 0.5) { //if moving vertically
					menu_index += sign(obj_input.input_array[i, YAXIS]) //move menu option by direction
					draw_count = 0 //reset draw count
					alarm[0] = MENU_DELAY //set input delay
				}
				if (obj_input.input_array[i, XAXIS] > 0.5) { //if moving right
					_select = true //cause a selection
					alarm[0] = MENU_DELAY //set input delay
				}
				if (obj_input.input_array[i, ATTACK]) { //if attacking
					_select = true //cause a selection
					alarm[0] = MENU_DELAY //set an input delay
					obj_input.sticky_attack[i] = true //set a sticky input
				}
				if (obj_input.input_array[i, SPECIAL]) { //if specialing
					_back = true //cause an exit
					alarm[0] = MENU_DELAY //set an input delay
				}
			}
		}

		menu_index = (menu_index + array_length_1d(menu_option)) mod array_length_1d(menu_option) //wrap menu index around its range

		if (_back) { //if wanting to exit
			//go to previous menu and set this menu to be inactive
			with(instance_create(-GUI_WIDTH, 0, obj_menu_vault)) {
				menu_index = 0	
			}
			active = false
		}

		if (_select) { //if selecting option
			switch (menu_index) {
				case 0: //names and profiles
					sub_menu = true //let sub menu handle it
				break;
				case 1: //controllers
					sub_menu = true //let sub menu handle it
				break;
				case 2: case 3: //rules and sound
					//let sub menu handle it
					sub_menu = true	
					creator.sub_menu = false
				break;
				case 4: //debug
					sub_menu = true //let sub menu handle it
				break;
			}
		}
	}
}