///@func scr_reset_players()
///@desc reset players
global.player_number = 0
with (obj_input) {
	button_const_array = []
	button_array = []
	for (var i = 0; i < array_height_2d(input_array); i++) {
		for (var o = 0; o < array_length_2d(input_array, i); o++) {
			input_array[i, o] = 0
		}
	}
	scr_initialise_controller_inputs()
}