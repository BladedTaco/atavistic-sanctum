///@func scr_handle_c_stick(player_number, _input)
///@desc change c stick inputs into their outputs
///@param player_number - the player slot number of the player
///@param _input - the temporary input array used to store current inputs

var _input;
_input = argument[1]


var j = 0 //the entry of the input array to change
var k = 1 //the value to change it to


if (power(_input[10], 2) + power(_input[11], 2) > power(c_stick_deadzone[argument[0]], 2)) { //if input is outside deadzone
	switch(c_stick_action[argument[0]]) {
		case C_SMASH_ATTACK: 
			_input[@ argument[0], 9] = SMASH_MOVE //set attack type to smash attack
			j = ATTACK
		break;
		
		case C_TILT_ATTACK: 
			_input[@ argument[0], 9] = TILT_MOVE //set attack type to tilt attack
			j = ATTACK
		break;
		
		case C_NEUTRAL_ATTACK:
			_input[@ argument[0], 9] = NEUTRAL_MOVE //set attack type to tilt attack
			j = ATTACK
		break;
		
		case C_SPECIAL_ATTACK: 
			_input[@ argument[0], 9] = SMASH_MOVE //set special type to directional
			j = SPECIAL
		break;
		
		case C_NEUTRAL_SPECIAL:
			_input[@ argument[0], 9] = NEUTRAL_MOVE //set special type to neutral
			j = SPECIAL
		break;
		
		case C_GRAB: 
			j = GRAB
		break;
		
		case C_ROLL: 
			_input[@ argument[0], 9] = SMASH_MOVE //make sure it recognises it as a roll
			j = SHIELD
		break;
		
		case C_TAUNT: 
			j = TAUNT
		break;
	}
	
	_input[@ argument[0], 0] = _input[10] //set normal xaxis to the c_stick xaxis value
	_input[@ argument[0], 1] = _input[11] //set normal yaxis to the c_stick yaxis value
	_input[@ argument[0], j] = k //set input mapped to c_stick to associated value (normally 1)
}



_input[@ argument[0], 10] = 0 //set alt_xaxis to 0
_input[@ argument[0], 11] = 0 //set alt_yaxis to 0