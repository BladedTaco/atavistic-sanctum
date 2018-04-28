///@func scr_input_buffer(player_number, _input)
///@desc handles the input buffer of the player number given and pushes out the inputs for the frame
///@param player_number - the number slot of the player
///@param _input - the temporary array used to hold this frames inputs
var j = 0
repeat(1) {
	
	var _index = global.input_buffer_length*100 + j

	

	//move all buffer entries down
	repeat (global.input_buffer_length) {
		for (var i = 0; i < 10; i++) {
			input_buffer_array[_index, i] = input_buffer_array[_index-100, i]
		}
		_index -= 100
	}
	j++
}