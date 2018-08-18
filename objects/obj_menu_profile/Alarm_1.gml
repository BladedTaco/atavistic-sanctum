/// @description define controls alarm

if (state = 4) { //setting all controls one at a time
	sub_menu = scr_define_input(player_number);
	if (sub_menu = -1) { //error found
		sub_menu = false //exit controller config
	} else if (sub_menu) { //still going
		alarm[1] = GAME_SPEED*2
	} else { //finished
		state = 3
		name = gamepad_get_description(controller)
		menu_option[10] = "MORE SETTINGS"
		menu_option[11] = "D-PAD UP (DU)"	
		menu_option[12] = "D-PAD DOWN (DD)"	
		menu_option[13] = "D-PAD LEFT (DL)"	
		menu_option[14] = "D-PAD RIGHT (DR)"	
		menu_option[15] = "R-TRIGGER (R2)"
		menu_option[16] = "L-TRIGGER (L2)"
		menu_option[17] = "L-STICK X (LX)"	
		menu_option[18] = "L-STICK Y (LY)"	
		menu_option[19] = "R-STICK X (RX)"	
		menu_option[20] = "R-STICK Y (RY)"	
		menu_option[21] = "ACCEPT"	
		menu_length = 22;
	}	
} else if (state = 3) { //setting an individual control
	sub_menu = false
	obj_input.controls_set[player_number] = menu_index + 2 - 1*(menu_index >= 10)
	scr_define_input(player_number);
	obj_input.controls_set[player_number] = 22
}