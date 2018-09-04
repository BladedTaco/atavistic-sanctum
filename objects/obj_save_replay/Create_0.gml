/// @description init variables
replay_buffer = 0
save_replay = false
saveid = 0
header_string = "" //replay header string

//create the replay file
replay_file_string = string("replays/" + date_date_string(date_current_datetime()) + ".txt") //get name of file based on time
if (file_exists(replay_file_string)) { //if a file already exists with this name
	var i = 0
	do { //loop until a free filename is found
		replay_file_string = string("replays/" + date_date_string(date_current_datetime()) + ".txt") //reset name for each loop
		replay_file_string = string_insert("_", replay_file_string, string_length(replay_file_string)-3) //insert an underscore before ".txt"
		replay_file_string = string_insert(string(i), replay_file_string, string_length(replay_file_string)-3) //insert current test number after the underscore
		i++ //increment i
	} until !file_exists(replay_file_string) //file name is free to use
}
replay_file_string = string_delete(replay_file_string, 1, 8) //set the string to be the file location wihtout the repalys/ prefix


depth = -1000