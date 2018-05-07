/// @description get and handle inputs/ input buffer

for (var i = 0; i < global.player_number; i++) {
	if (player_is_local[i]) {
		scr_get_input(i, controller[i], controller_number[i])
	} else {
		scr_input_buffer_nonlocal(i)	
	}





scr_input_buffer_nonlocal(1)



}