///@func scr_record_inputs()
///@desc records inputs to the replay file


for (var i = 0; i < global.player_number; i++) { //for each player
	file_text_write_real(replay_file, global.match_frame) //write current frame
	file_text_write_real(replay_file, i) //write player number
	for (var o = 0; o < 10; o++) { //for each input
		file_text_write_real(replay_file, input_array[i, o]) //write the input
	}
	file_text_writeln(replay_file) //go to next line for next player
}
