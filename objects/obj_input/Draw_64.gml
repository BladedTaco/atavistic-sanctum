/// @description 

if (paused >= 0) {
	if (sprite_exists(pause_sprite)) {
		draw_sprite(pause_sprite, 0, 0, 0)	
	}
	draw_set_alpha(0.45)
	draw_set_colour(c_black)
	var _gui_x = display_get_gui_width()
	var _gui_y = display_get_gui_height()
	draw_rectangle(0, 0, _gui_x, _gui_y, false)
	draw_set_alpha(1)
	draw_rectangle(0, 0, _gui_x, 50, false)
	draw_set_font(fnt_pixel_4)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_outlined(_gui_x/2, _gui_y/2, c_black, c_white, "PAUSED: PLAYER " + string(paused + 1), 4)
	draw_set_font(fnt_pixel_3)
	var _col = $3f3f3f
	var _len = array_length_1d(menu_option)
	for (var i = 0; i < _len; i++) {
		if (i = menu_index) {
			_col = $7f7f7f
		} else {
			_col = $3f3f3f	
		}
		draw_text_outlined((((i - menu_index + _len + 2.5) mod _len) - 0.5)*_gui_x/4, 20, _col, c_white, menu_option[i mod _len], 3)
	}
	if (menu_index != round(menu_index)) { //move menu option
		menu_index = ((menu_index + 0.05*menu_direction) + _len) mod _len
		if (abs(menu_index - round(menu_index)) < 0.05) {
			menu_direction = 0
			menu_index = round(menu_index)
		}
	} else { //control menu
		//check for menu movement
		if (abs(input_array[paused, XAXIS]) > 0.5) {
			menu_direction = sign(input_array[paused, XAXIS])
			menu_index = ((menu_index + 0.05*menu_direction) + _len) mod _len
		}
		
		//check for menu selection
		if ((input_array[paused, ATTACK] and !sticky_attack[paused]) or (menu_index = 2) or (menu_index = 3)) {
			sticky_attack[paused] = true
			var _end = false
			switch (menu_index) {
				case 5: //forfeit
					_end = true
				case 0: //resume
					file_delete("PAUSE_SCREEN") //delete the pause screen
					sprite_delete(pause_sprite)
					instance_activate_all()
					instance_deactivate_object(obj_menu_char_select)
					if (_end) {
						scr_end_game(2, paused)	
					}
					paused = -1
				break;
				case 1: //hitboxes: shwon
					if (global.show_hitboxes) {
						global.show_hitboxes = false	
						menu_option[1] = "hitboxes: hidden"
					} else {
						global.show_hitboxes = true
						menu_option[1] = "hitboxes: shown"
					}
				break;
				case 2: //Input buffer: 6 frames
					if (alarm[1] <= 0) {
						alarm[1] = GAME_SPEED/10
						if (input_array[paused, YAXIS] > 0.5) {
							global.input_buffer_length = max(global.input_buffer_length - 1, 0)
						} else if (input_array[paused, YAXIS] < -0.5) {
							global.input_buffer_length = min(global.input_buffer_length + 1, 30)
						}
						menu_option[2] = "Input lag: " + string(global.input_buffer_length) + " frame"
					}
				break;
				case 3: //game speed: 1x
					if (alarm[1] <= 0) {
						alarm[1] = GAME_SPEED/10
						if (input_array[paused, YAXIS] > 0.5) {
							room_speed = max(room_speed - 1, 10)
						} else if (input_array[paused, YAXIS] < -0.5) {
							room_speed = min(room_speed + 1, 120)
						}
						menu_option[3] = "game speed: " + string(room_speed/GAME_SPEED) + "x"
					}
				break;
				case 4: //UI: Shwon
					if (global.show_ui) {
						global.show_ui = false
						menu_option[3] = "ui: hidden"
					} else {
						global.show_ui = true
						menu_option[3] = "ui: shown"
					}
				break;
			}
		}
	}
} else {
	/*	TODO MOVE THIS CODE
	var j = 1;
	while (controls_set[j] = 22) {		
		j++	
	}
	
	switch (controls_set[j] - 2) {
		case -2: draw_text_normal(600, 400, "Hold any face button, then press G to configure controller") break;
		case -1: draw_text_normal(600, 400, "Make sure nothing is pressed, then press G to configure, or H to load default") break;
		case 0:  draw_text_normal(600, 400, "Hold ATTACK, then press G") break;
		case 1:  draw_text_normal(600, 400, "Hold SPECIAL, then press G") break;
		case 2:  draw_text_normal(600, 400, "Hold JUMP, then press G") break;
		case 3:  draw_text_normal(600, 400, "Hold ALT_JUMP, then press G") break;
		case 4:  draw_text_normal(600, 400, "Hold GRAB, then press G") break;
		case 5:  draw_text_normal(600, 400, "Hold ALT_GRAB, then press G") break;
		case 6:  draw_text_normal(600, 400, "Hold PAUSE, then press G") break;
		case 7:  draw_text_normal(600, 400, "Hold ALT_PAUSE, then press G") break;
		case 8:  draw_text_normal(600, 400, "Hold L3, then press G") break;
		case 9:  draw_text_normal(600, 400, "Hold R3, then press G") break;
		case 10: draw_text_normal(600, 400, "Hold DPAD_UP, then press G") break;
		case 11: draw_text_normal(600, 400, "Hold DPAD_DOWN, then press G") break;
		case 12: draw_text_normal(600, 400, "Hold DPAD_LEFT, then press G") break;
		case 13: draw_text_normal(600, 400, "Hold DPAD_RIGHT, then press G") break;
		case 14: draw_text_normal(600, 400, "Hold RIGHT TRIGGER, then press G") break;
		case 15: draw_text_normal(600, 400, "Hold LEFT TRIGGER, then press G") break;
		case 16: draw_text_normal(600, 400, "Hold L_STICK fully right, then press G") break;
		case 17: draw_text_normal(600, 400, "Hold L_STICK fully down, then press G") break;
		case 18: draw_text_normal(600, 400, "Hold C_STICK fully right, then press G") break;
		case 19: draw_text_normal(600, 400, "Hold C_STICK fully down, then press G") break;
		case 20: draw_text_normal(600, 400, "Press G to reset controls") break;
	}

	if (global.debug) {
		for (var i = 0; i <= global.player_number; i++) {
			for (var o = 0; o < array_length_2d(input_array, i); o++) {
				draw_text_normal(i*150 + 50, o*15 + 50, input_array[i, o])
			}
		}

		draw_set_colour(c_aqua)
		for (var i = 0; i <= global.input_buffer_length; i++) {
			draw_circle(400 + i*15, 100 + 50*input_buffer_array[i*100 + 0, XAXIS], 5, false)
		}
	}
	*/
}