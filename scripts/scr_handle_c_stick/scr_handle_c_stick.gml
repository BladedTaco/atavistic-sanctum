///@func scr_handle_c_stick(player_number, _input)
///@desc change c stick inputs into their outputs
///@param player_number - the player slot number of the player
///@param _input - the temporary input array used to store current inputs

if (instance_exists(obj_match_handler)) {
	var _input;
	_input = argument[1]

	var j = 0 //the entry of the input array to change
	var k = 1 //the value to change it to

	switch (obj_match_handler.state[argument[0]]) {
		case AIRBORNE: case JUMP_RISE:
			if (c_stick_action[argument[0]] = C_TAUNT) {
				exit; //exit script if unable to use c stick	
			}
		case GROUNDED: case WALKING: case RUNNING: case JUMPING: case SMASH_ATTACK:
		break;
		case SHIELDING:
			if (c_stick_action[argument[0]] !=  C_ROLL) {
				exit; //exit script if unable to use c stick	
			}
		break;
		default:
			exit; //exit script if unable to use c stick
		break;
	}

	if (point_distance(0, 0, _input[ALT_XAXIS], _input[ALT_YAXIS]) > c_stick_deadzone[argument[0]]) { //if input is outside deadzone
		switch(c_stick_action[argument[0]]) {
			case C_SMASH_ATTACK: 
				if !(obj_match_handler.state[argument[0]] = SMASH_ATTACK) {
					_input[@ TILT] = SMASH_MOVE //set attack type to smash attack
				}
				j = ATTACK
			break;
		
			case C_TILT_ATTACK: 
				_input[@ TILT] = TILT_MOVE //set attack type to tilt attack
				j = ATTACK
			break;
		
			case C_NEUTRAL_ATTACK:
				_input[@ TILT] = NEUTRAL_MOVE //set attack type to tilt attack
				j = ATTACK
			break;
		
			case C_SPECIAL_ATTACK: 
				_input[@ TILT] = SMASH_MOVE //set special type to directional
				j = SPECIAL
			break;
		
			case C_NEUTRAL_SPECIAL:
				_input[@ TILT] = NEUTRAL_MOVE //set special type to neutral
				j = SPECIAL
			break;
		
			case C_GRAB: 
				j = GRAB
			break;
		
			case C_ROLL: 
				_input[@ TILT] = SMASH_MOVE //make sure it recognises it as a roll
				j = SHIELD
			break;
		
			case C_TAUNT: 
				j = TAUNT
			break;
		}
	
		if (obj_match_handler.player[argument[0]].alarm[3] <= 0) {
			_input[@ XAXIS] = _input[@ ALT_XAXIS] //set normal xaxis to the c_stick xaxis value
			_input[@ YAXIS] = _input[@ ALT_YAXIS] //set normal yaxis to the c_stick yaxis value
			obj_match_handler.player[argument[0]].alarm[3] = global.input_buffer_length
		}
		_input[@ j] = k //set input mapped to c_stick to associated value
	}



	_input[@ ALT_XAXIS] = 0 //set alt_xaxis to 0
	_input[@ ALT_YAXIS] = 0 //set alt_yaxis to 0
}