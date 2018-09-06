/// @description handle menu
if (active = 1) { //if active
	var _select = false
	var _back = false
	for (var i = 0; i < global.player_number; i++) { //for each player
		//move cursor
		cursor_x += 8*obj_input.input_array[i, XAXIS]
		cursor_y += 8*obj_input.input_array[i, YAXIS]
		if (obj_input.input_array[i, ATTACK]) { //if attacking
			_select = true	 //cause a selection
		}
		if (obj_input.input_array[i, SPECIAL]) { //if specialing
			_back = true	 //cause a selection
		}
	}
	//clamp cursor position to menu bounds
	cursor_x = clamp(cursor_x, GUI_WIDTH*0.1, GUI_WIDTH*0.9)
	cursor_y = clamp(cursor_y, GUI_HEIGHT*0.1, GUI_HEIGHT*0.9)
	if (_select) { //if selecting option
		var _xx, _yy;
		for (var i = 0; i < array_length_1d(menu_sprite); i++) { //for each menu sprite
			//get position
			_xx = GUI_WIDTH*0.2*((i mod 4) + 1)
			_yy = GUI_HEIGHT*0.4*(i div 4) + GUI_HEIGHT*0.3
			if (point_in_rectangle(cursor_x, cursor_y, _xx - 80, _yy - 45, _xx + 80, _yy + 45)) { //cursor has selected stage
				scr_start_match(false, asset_get_index("rm_match_" + string_replace(menu_option[i], " ", "_"))) //move to the selected match room	
				active = 2 //set active to ending
				obj_menu_char_select.active = true //make character select menu active
				break; //break loop
			}
		}
		if (i = array_length_1d(menu_sprite)) { //random stage selected as no stage was selected
			scr_start_match(false, asset_get_index("rm_match_" + string_replace(menu_option[irandom(i-1)], " ", "_"))) //move to a random match room
			active = 2 //set active to ending
			obj_menu_char_select.active = true //make character select menu active
		}
	}
	if (_back) { //if wanting to exit menu
		//exit menu to character select
		obj_menu_char_select.active = true
		active = 2
	}
} else { //inactive or ending
	if (active < 1) { //inactive
		y -= GUI_HEIGHT*0.05 //move up
		if (y <= 0) { //if centered
			y = 0 //centre self
			active = 1 //make active
		}
	} else { //ending
		y -= GUI_HEIGHT*0.05 //move up
		if (y <= -GUI_HEIGHT) { //if offscreen
			instance_destroy(); //destroy self
		}	
	}
}
