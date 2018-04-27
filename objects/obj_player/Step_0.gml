/// @description 
if (player_is_local) {
	scr_get_input(player_number, controller, controller_number)
} else {
	scr_input_buffer_nonlocal(player_number)	
}

//scr_control_character

//in match handler, scr_check_collisions