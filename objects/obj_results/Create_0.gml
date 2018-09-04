/// @description define variables
visible = false //make invisible
for (var i = 0; i < global.player_number; i++) { //for each player
	kills[i, 0] = noone //initialise kill list
	deaths[i, 0] = noone //initialise killer list
	//placeholder variables to be passed by the player to this object
	pal_surface[i] = -1 
	character[i] = -1
	name[i] = ""
	img_blend[i] = -1
	player_col[i] = -1
	real_placing[i, 0] = -1 //player number
	real_placing[i, 1] = -1 //placing value
	real_placing[i, 2] = -1 //placing position
	for (var o = 0; o < global.player_number; o++) { //for each player
		kill_count[i, o] = 0 //set kill list to empty values
		death_count[i, o] = 0 //set death list to empty values
	}
	ready[i] = 0 //whether the player has readied up to leave the menu
}
placing[0] = -1 //intialise placing
num = 0 //number of players
save_replay = false //whether or not to save replay

//position and alarm
alarm[0] = -1
y = GUI_HEIGHT
x = 0
