///@func scr_record_inputs()
///@desc records inputs to the replay file

if !(global.wait) {
	if (global.match_frame > 0) {
		var _str = ""
		_str += string(global.match_frame) + "\n" //write the match frame
		for (var i = 0; i < global.player_number; i++) { //for each player
			if (instance_exists(player[i])) {
				_str += string(i) + "\n" //write the player number
				for (var o = 0; o < 10; o++) { //for each input
					if (input_array[i, o] != 0) { //if there is an input to write
						_str += string(o) + " " + string(input_array[i, o]) + "\n" //write the input
					}
				}
				_str += "\n" //write a new line for next player
			}
		}
		replay_string[global.match_frame] = _str //add to the replay string
	}
	global.match_frame += 1 //advance match frame
}
