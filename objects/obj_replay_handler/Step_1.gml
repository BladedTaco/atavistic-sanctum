/// @description parse inputs
if (active) {
	if (global.match_frame > 0) {
		if (buffer_tell(replay_buffer) < buffer_get_size(replay_buffer)) { //there is replay left to read
			//set the input array to base values
			for (var i = 0; i < 8; i++) {
				for (var o = 0; o < 10; o++) {
					input_array[i, o] = 0
				}
			}	
			var _str = buffer_read(replay_buffer, buffer_string) //get the frames string
			//parse string for inputs
			_str = scr_delete_line(_str) //skip line
			for (var i = 0; i < player_number; i++) {
				if (i = real(scr_read_line(_str))) { //correct player
					_str = scr_delete_line(_str)
					while (scr_read_line(_str) != "") { //this player has inputs to read
						input_array[i, real(string_copy(_str, 1, 1))] = real(scr_read_line(string_delete(_str, 1, 2))) //read out the inputs into the input array
						_str = scr_delete_line(_str) //read to next line
					}
					_str = scr_delete_line(_str) //read past seperator
				}
				input_array[i, PAUSE] = 0 //dont allow pausing
			}
		} else {
			active = false	
		}
	}
	global.match_frame += 1
} else {
	if (buffer_tell(replay_buffer) >= buffer_get_size(replay_buffer)) {
		alarm[0] = GAME_SPEED
		buffer_seek(replay_buffer, buffer_seek_relative, -1) //move before the end of the buffer, so this message doesnt reappear forever
	}
}
