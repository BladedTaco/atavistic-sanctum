///@func scr_handle_directional_stick(player_number, _input)
///@param player_number - the number slot of the player
///@param _input - the temporary input array used to hold this frames inputs
///@desc figures out whether a directional movement was nothing, a tilt or a smash

var _input = argument[1]


//axis multipliers
_input[@ XAXIS] *= axis[argument[0], 0]
_input[@ YAXIS] *= axis[argument[0], 1]
_input[@ ALT_XAXIS] *= axis[argument[0], 2]
_input[@ ALT_YAXIS] *= axis[argument[0], 3]


var _movement = point_distance(0, 0, _input[0], _input[1])
var _old_position = point_distance(0, 0, input_array[argument[0], 0], input_array[argument[0], 1])
var _difference = point_distance(_input[0], _input[1], input_array[argument[0], 0], input_array[argument[0], 1])
var _tilt_deadzone = 0.3 //temporary value
var _smash_deadzone = 0.6 //temporary value
var _smash_difference = smash[argument[0]] //temporary value

if (_movement < _old_position) { _difference = 0 } //make difference 0 if returning to centre

if (_movement < l_stick_deadzone[argument[0]]) { //if left stick input is inside deadzone
	_input[@ 0] = 0 //set xaxis to 0
	_input[@ 1] = 0 //set yaxis to 0
} else if (_movement < _tilt_deadzone) { //neutral movement
	_input[@ 9] = NEUTRAL_MOVE //set movement type to neutral
//} else if (_movement < _smash_deadzone) { //tilt movement
//	_input[@ 9] = TILT_MOVE //set movement type to tilt
} else if (_difference > _smash_difference){ //smash movement
	_input[@ 9] = SMASH_MOVE //set movement type to smash
} else { //slow movement but on the outside of the stick
	_input[@ 9] = TILT_MOVE	//set movement type to tilt
}