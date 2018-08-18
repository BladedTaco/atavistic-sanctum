/// @description initialise the match handler

alarm[0] = -1

pal_surface = surface_create(16, 16)

//input variables and control variables initialisation
for (var i = 0; i < 8; i++) {
	old_axis[i, 0] = 0
	input_array[i, 0] = 0
	state[i] = FREEFALL
	jumps[i] = 1
	player[i] = noone //create the players here and populate the array with their instance ids
}

header_string = "" //header string for replay file
starting = 3

global.match_frame = 0

//get data from server for the match