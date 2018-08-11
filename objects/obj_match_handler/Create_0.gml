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


starting = 3

global.match_frame = 0

//get data from server for the match



replay_string[0]  = ""//init replay string
//create the replay file
replay_file = string("replays/" + date_date_string(date_current_datetime()) + ".txt") //get name of file based on time
if (file_exists(replay_file)) { //if a file already exists with this name
	var i = 0
	do { //loop until a free filename is found
		replay_file = string("replays/" + date_date_string(date_current_datetime()) + ".txt") //reset name for each loop
		replay_file = string_insert("_", replay_file, string_length(replay_file)-3) //insert an underscore before ".txt"
		replay_file = string_insert(string(i), replay_file, string_length(replay_file)-3) //insert current test number after the underscore
		i++ //increment i
	} until !file_exists(replay_file) //file name is free to use
}
replay_file_string = replay_file
replay_file = file_text_open_write(replay_file) //create replay file and store its index
file_text_write_string(replay_file, string(global.game_version)); file_text_writeln(replay_file); //write game version
file_text_close(replay_file)
//header is written in scr_start_match