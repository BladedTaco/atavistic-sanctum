/// @description initialise the match handler


//input variables and control variables initialisation
for (var i = 0; i < 8; i++) {
	old_axis[i, 0] = 0
	input_array[i, 0] = 0
	state[i] = FREEFALL
	jumps[i] = 1
	momentum_x[i] = 0
	momentum_y[i] = 0
	player[i] = -1 //create the players here and populate the array with their instance ids
}
hitbox = false //draw hitboxes on true

st[0] = 0
st[1] = 0
st[2] = 0
st[3] = 0
st[4] = 0
st[5] = 0

with(instance_create(200, -200, obj_player)) {
	image_blend = c_aqua
	player_number = 0
	other.player[0] = id
	controller = true
	sprite_index = scr_get_sprite(id, "hurt_down")
}

with(instance_create(300, -200, obj_player)) {
	image_blend = c_lime
	player_number = 1
	other.player[1] = id
	controller = false
	sprite_index = scr_get_sprite(id, "hurt_down")
}
global.player_number = 2

//get data from server for the match





/*
//create the replay file
replay_file = string(working_directory + "replays/" + date_datetime_string(date_current_datetime()) + ".txt") //get name of file based on time
if (file_exists(replay_file)) { //if a file already exists with this name
	var i = 0
	do {
		replay_file = string_insert("_", replay_file, string_length(replay_file)-4) //insert an underscore before ".txt"
		replay_file = string_insert(string(i), replay_file, string_length(replay_file)-4) //insert current test number after the underscore
		i++
	} until !file_exists(replay_file) //file name is free to use
}
replay_file = file_text_open_write(replay_file) //create replay file and store its index

//write the file header  
file_text_write_string(replay_file, string(global.game_version)) 
for (var i = 0; i < global.player_number; i++) {
	file_text_writeln(replay_file) //go to next line
	file_text_write_real(replay_file, i) //player number
	file_text_write_string(replay_file, string(data_array[i, 0])) //player name
	file_text_write_string(replay_file, string(data_array[i, 1])) //player profile name
	file_text_write_string(replay_file, string(data_array[i, 2])) //character
	file_text_write_string(replay_file, string(data_array[i, 3])) //custom colour string
	file_text_write_string(replay_file, string(data_array[i, 5])) //matchmaking rank
	file_text_write_string(replay_file, string(data_array[i, 7])) //team colour
}
file_text_writeln(replay_file) //go to next line
file_text_writeln(replay_file) //go to next line