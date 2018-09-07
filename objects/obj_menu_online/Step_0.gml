/// @description control manu
if (!active) { //if inactive
	if (x < 0) { //offf the left side
		x += GUI_WIDTH/15 //move right
		if (x >= 0) { //if near centerd
			x = 0 //center
			active = true //become active
		}
	} else { //off the right side or centered
		x += GUI_WIDTH/15 //move right
		if (x > GUI_WIDTH) { //if off screen
			instance_destroy();	 //destroy self
		}
	}
} else { //if active
	if (alarm[0] <= 0) { //check for input
		var _back = false
		var _select = false
		for (var i = 0; i < global.player_number; i++) { //for each player
			if (abs(obj_input.input_array[i, XAXIS]) > 0.5) { //moveing horizontally
				menu_index += sign(obj_input.input_array[i, XAXIS]) //move mennu index
				menu_index = (menu_index + menu_length) mod menu_length //wrap menu index
				alarm[0] = MENU_DELAY //set input delay
			}
			if (obj_input.input_array[i, SPECIAL]) { //wanting to exit
				_back = true //cause an exit
				alarm[0] = MENU_DELAY //set input delay
			}
			if (obj_input.input_array[i, ATTACK]) { //wanting to select
				_select = true //casue a selection
				alarm[0] = MENU_DELAY //set an input delay
			}
		}
		if (_back) { //if wanting to exit
			//return to main menu
			with(instance_create(-GUI_WIDTH, 0, obj_menu_main)) {
				menu_index = 1
			}
			active = false //become inactive
		} else if (_select) { //if selecting
			switch (menu_index) { //based on menu index
				case 0: //host
					//host a match and go to character select menu
					global.network_ip = "127.0.0.1"
					instance_create(0, 0, obj_server)
					instance_create(0, 0, obj_client)
					instance_create(-GUI_WIDTH, 0, obj_menu_char_select)
					active = false
				break;
				
				case 1: //join
					//test for a connection with obj_client
					sub_menu = true
					global.network_ip = "127.0.0.1"
					instance_create(0, 0, obj_client)
					alarm[0] = GAME_SPEED*3 //set a delay until it fails
				break;
			}
		}
	}
}