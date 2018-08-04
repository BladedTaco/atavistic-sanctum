/// @description define controls alarm

if (state = 4) {
	sub_menu = scr_define_input(player_number);
	if (sub_menu = -1) { //error found
		sub_menu = false //exit controller config
	} else if (sub_menu) { //still going
		alarm[1] = GAME_SPEED*2
	} else { //finished
		state = 3
		name = gamepad_get_description(controller)
	}	
}