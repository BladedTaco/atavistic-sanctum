///@func scr_input_buffer(player_number, _input)
///@desc handles the input buffer of the player number given and pushes out the inputs for the frame
///@param player_number - the number slot of the player
///@param _input - the temporary array used to hold this frames inputs

var _input = argument[1]
var _index = global.input_buffer_length*100 + argument[0]

//push last position in input_buffer into usable input array
for (var i = 0; i < array_length_1d(_input); i++) {
	input_array[argument[0], i] = input_buffer_array[_index, i]
}

//move all buffer entries down
repeat (global.input_buffer_length) {
	for (var i = 0; i < array_length_1d(_input); i++) {
		input_buffer_array[_index, i] = input_buffer_array[_index-100, i]
	}
	_index -= 100
}

//fill the first position in the buffer with this frames inputs
if (player_is_local) {
	input_buffer_array[_index, i] = _input[i]
}