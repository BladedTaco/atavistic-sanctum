///@func scr_control_character()
///@desc controls the characters based on movements and states

var i = 0 //initialise the loop counter to 0
var _check_state, _move_character, _dir, _inst; //initialise some local variables in memory
do {
	_dir = point_direction(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]) //get direction
	_check_state = true //set base state of variable
	_move_character = 0 //set base state of variable
	_inst = player[i] //get the player object corresponding to the player number
	if (!instance_exists(_inst)) { exit }
	if (input_array[i, PAUSE]) { //pause or unpause
		global.paused = !global.paused	
	}
	
	switch (state[i]) { //perform actions based on state
		case GROUNDED: case WALKING: 
			if (input_array[i, SHIELD]) { //shield
				state[i] = scr_perform_shield(_inst, i)	
			}
			if (input_array[i, ATTACK]) { //attack
				state[i] = scr_perform_attack(_inst, i, input_array[i, TILT], _dir)
			}
			if (input_array[i, SPECIAL]) { //special attacck
				state[i] = scr_perform_attack(_inst, i, 3, _dir)
			}
			if (input_array[i, GRAB]) { //grab
				state[i] = scr_perform_grab(_inst, i, 0, _dir)
			}
			if (input_array[i, JUMP]) { //jump
				state[i] = scr_perform_jump(_inst, i, 0)
			}
			if (input_array[i, TAUNT]) { //taunt
				state[i] = scr_perform_taunt(_inst, i)
			}
		break;
		
		
		case TILT_ATTACK: case SMASH_ATTACK: case SPECIAL_ATTACK: case LANDING: case DODGING: case AIR_DODGING:
			_move_character = 2 //drift
		break;
		
		case SHIELDING: 
			if (_inst.character = GEO) {
				_move_character = 0
			} else {
				_move_character = 2
			}
		break;
		
		case LEDGE_ALT: 
			_move_character = 1 //stop
		break;
		
		case HIT_STUN:
			_move_character = 3 //DI
		break;
		
		case FREEFALL: case SPEED_UP: case DASHING: case JUMP_RISE:
			if (input_array[i, SHIELD] and (character = GEO)) {
				state[i] = scr_perform_shield(_inst, i)	
			}
		case AIR_ATTACK:
			_move_character = 0 //move normally
		break;
		
		case RUNNING: 
			if (input_array[i, SHIELD]) { //shield
				state[i] = scr_perform_shield(_inst, i)	
			}
			if (input_array[i, ATTACK]) { //attack
				state[i] = scr_perform_attack(_inst, i, 4, _dir)
			}
			if (input_array[i, SPECIAL]) { //special attacck
				state[i] = scr_perform_attack(_inst, i, 3, _dir)
			}
			if (input_array[i, GRAB]) { //grab
				state[i] = scr_perform_grab(_inst, i, 0, _dir)
			}
			if (input_array[i, JUMP]) { //jump
				state[i] = scr_perform_jump(_inst, i, 0)
			}
		break;
		
		case JUMPING: 
			_move_character = 2 //drift
			if (input_array[i, ATTACK]) { //attack
				state[i] = scr_perform_attack(_inst, i, input_array[i, TILT], _dir)
			}
			if (input_array[i, SPECIAL]) { //special attacck
				state[i] = scr_perform_attack(_inst, i, 3, _dir)
			}
			if (input_array[i, GRAB]) { //grab
				state[i] = scr_perform_grab(_inst, i, 0, _dir)
			}
		break;
		
		case AIRBORNE: 
			if (input_array[i, SHIELD]) { //shield
				state[i] = scr_perform_shield(_inst, i)	
			}
			if (input_array[i, ATTACK]) { //attack
				state[i] = scr_perform_attack(_inst, i, 5, _dir)
			}
			if (input_array[i, SPECIAL]) { //special attacck
				state[i] = scr_perform_attack(_inst, i, 3, _dir)
			}
			if (input_array[i, GRAB]) { //grab
				state[i] = scr_perform_grab(_inst, i, 1, _dir)
			}
			if (input_array[i, JUMP]) { //jump
				state[i] = scr_perform_jump(_inst, i, 1)
			}
		break;
		
		case LEDGE: 
			_move_character = 1 //stop
			if (input_array[i, SHIELD]) { //roll
				state[i] = scr_perform_ledge(_inst, i, 2)	
			}
			if (input_array[i, ATTACK] or input_array[i, SPECIAL]) { //attack
				state[i] = scr_perform_ledge(_inst, i, 1, _dir)
			}
			if (input_array[i, GRAB]) { //grab
				state[i] = scr_perform_ledge(_inst, i, 3, _dir)
			}
			if (input_array[i, JUMP]) { //jump
				state[i] = scr_perform_ledge(_inst, i, 4)
			}
		break;
		

		case TECHING: 
			_move_character = 1 //stop
			if (input_array[i, JUMP]) { //jump
				state[i] = scr_perform_jump(_inst, i, 0)	
			}
		break;
		
		case GRABBING:
			if (input_array[i, ATTACK]) { //grab jab
				scr_perform_attack(_inst, i, 6, 0)
			}
			_move_character = 2 //drift
		break;
		
	}
	if (_move_character = 0) { //default move character
		scr_move_character(_inst, i)
	} else { //handle special movement cases
		scr_handle_movement(_inst, i, _move_character)
	}
	
	i++
}  until(i >= global.player_number)