/// @description 

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

for (var i = 0; i <= global.player_number; i++) {
	for (var o = 0; o < array_length_2d(input_array, i); o++) {
		draw_text_normal(i*150 + 50, o*15 + 50, input_array[i, o])
	}
}

draw_set_colour(c_aqua)
for (var i = 0; i <= global.input_buffer_length; i++) {
	draw_circle(400 + i*15, 100 + 50*input_buffer_array[i*100 + 0, XAXIS], 5, false)
}
