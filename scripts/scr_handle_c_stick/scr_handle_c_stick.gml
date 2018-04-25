///@func scr_handle_c_stick(player_number, _input)
///@desc change c stick inputs into their outputs
///@param player_number - the player slot number of the player
///@param _input - the temporary input array used to store current inputs

var _input;
_input = argument[1]


var j = 9
var k = 0


if (abs(_input[11]) + abs(_input[10]) > 0.5) {
	k = 1	
	
	_input[@ argument[0], j] = k
	_input[@ argument[0], 10] = 0
	_input[@ argument[0], 11] = 0
}


