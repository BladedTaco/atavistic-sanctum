///@func scr_handle_directional_stick(player_number, _input)
///@param player_number - the number slot of the player
///@param _input - the temporary input array used to hold this frames inputs
///@desc figures out whether a directional movement was nothing, a tilt or a smash

var _input = argument[1]

var _movement = power(_input[0], 2) + power(_input[1], 2)
var _old_position = power(input_array[argument[0], 0], 2) + power(input_array[argument[0], 1], 2)
var _tilt_deadzone = power(0.5, 2) //temporary value
var _smash_deadzone = power(0.75, 2) //temporary value
var _smash_difference = power(0.25, 2) //temporary value

if (_movement < power(l_stick_deadzone[argument[0]], 2)) { //if left stick input is inside deadzone
	_input[@ 0] = 0 //set xaxis to 0
	_input[@ 1] = 0 //set yaxis to 0
} else if (_movement < _tilt_deadzone) { //neutral movement
	_input[@ 9] = NEUTRAL_MOVE //set movement type to neutral
} else if (_movement < _smash_deadzone) { //tilt movement
	_input[@ 9] = TILT_MOVE //set movement type to tilt
} else if (_movement - _old_position > _smash_difference){ //smash movement
	_input[@ 9] = SMASH_MOVE //set movement type to smash
} else { //slow movement but on the outside of the stick
	_input[@ 9] = TILT_MOVE	//set movement type to tilt
}