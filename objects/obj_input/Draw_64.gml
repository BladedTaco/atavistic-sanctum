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
	draw_text_outlined(_gui_x/2, _gui_y/2, c_black, c_white, "PAUSED", 4)
	draw_set_font(fnt_pixel_3)
	draw_text_outlined(1.2*_gui_x/4, 20, $303030, c_white, "QUIT: ATTACK + SPECIAL + SHIELD + PAUSE", 3)
	draw_text_outlined(3.2*_gui_x/4, 20, $303030, c_white, "PAUSED: PLAYER " + string(paused + 1), 3)
} else {
	switch (controls_set[0] - 2) {
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

	if (debug_mode) {
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
}