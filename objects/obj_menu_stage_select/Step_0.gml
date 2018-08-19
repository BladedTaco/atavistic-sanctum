/// @description 
if (active = 1) {
	var _select = false
	var _back = false
	for (var i = 0; i < global.player_number; i++) {
		cursor_x += 8*obj_input.input_array[i, XAXIS]
		cursor_y += 8*obj_input.input_array[i, YAXIS]
		if (obj_input.input_array[i, ATTACK]) {
			_select = true	
		}
		if (obj_input.input_array[i, SPECIAL]) {
			_back = true	
		}
	}
	cursor_x = clamp(cursor_x, GUI_WIDTH*0.1, GUI_WIDTH*0.9)
	cursor_y = clamp(cursor_y, GUI_HEIGHT*0.1, GUI_HEIGHT*0.9)
	if (_select) { //if selected option
		var _xx, _yy;
		for (var i = 0; i < array_length_1d(menu_sprite); i++) {
			_xx = GUI_WIDTH*0.2*((i mod 4) + 1)
			_yy = GUI_HEIGHT*0.4*(i div 4) + GUI_HEIGHT*0.3
			if (point_in_rectangle(cursor_x, cursor_y, _xx - 80, _yy - 45, _xx + 80, _yy + 45)) { //selected stage
				scr_start_match(false, asset_get_index("rm_match_" + string_replace(menu_option[i], " ", "_"))) //move to the match room	
				active = 2
				obj_menu_char_select.active = true
				break;
			}
		}
		if (i = array_length_1d(menu_sprite)) { //random stage selected
			scr_start_match(false, asset_get_index("rm_match_" + string_replace(menu_option[irandom(i-1)], " ", "_")))
			active = 2
			obj_menu_char_select.active = true
		}
	}
	if (_back) { //if wanting to exit menu
		//exit menu to character select
		obj_menu_char_select.active = true
		active = 2
	}
} else {
	if (active < 1) {
		y -= GUI_HEIGHT*0.05
		if (y <= 0) {
			y = 0
			active = 1
		}
	} else {
		y -= GUI_HEIGHT*0.05
		if (y <= -GUI_HEIGHT) {
			instance_destroy();
		}	
	}
}
