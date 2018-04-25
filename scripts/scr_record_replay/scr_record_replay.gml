///@func scr_record_inputs(player_number)
///@desc saves inputs to the input buffer and the replay queue
///@param player_number - the slot of the player

with (obj_player) {
	var _index = global.current_frame*100 + player_number
	for (var i = 0; i < 10; i++) {
		other.replay_array[_index, i] = input_array[player_number, i]
	}
}