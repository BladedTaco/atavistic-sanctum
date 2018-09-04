/// @description initialise the match handler

alarm[0] = -1 //set alarm

//create a surface and initialise a variable for holding a sprite of the characters pallet sufaces backups
pal_surface = surface_create(16, 16)
pal_sprite = -1

//input variables and control variables initialisation
for (var i = 0; i < 8; i++) { //for each possible player
	//set base states
	old_axis[i, 0] = 0
	input_array[i, 0] = 0
	state[i] = FREEFALL
	jumps[i] = 1
	player[i] = noone //create the players here and populate the array with their instance ids
}

header_string = "" //header string for replay file
starting = 3 //how many seconds until match starts

global.match_frame = 0 //set global match frame

random_set_seed(42) //set random seed for deterministic play

//get data from server for the match
