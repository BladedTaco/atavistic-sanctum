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
	do {
		var _state = state[i]
		switch (state[i]) { //perform actions based on state
			case GROUNDED: 
				if (abs(input_array[i, XAXIS]) > obj_input.l_stick_deadzone[i]) { //change direction
					_inst.image_xscale = sign(input_array[i, XAXIS])
				}
			case WALKING: 
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
					state[i] = scr_perform_jump_squat(_inst, i, 0)
				}
				if (input_array[i, TAUNT]) { //taunt
					state[i] = scr_perform_taunt(_inst, i)
				}
				_move_character = 0 //move normally
			break;
		
			case AIR_DODGING:
				if (scr_check_for_ground(_inst)) {
					state[i] = LANDING
					_inst.sprite_index = scr_get_sprite(_inst, "land") 
					_inst.image_index = 0
				}
			case TILT_ATTACK: case SMASH_ATTACK: case SPECIAL_ATTACK: case LANDING: case DODGING:
				_move_character = 2 //drift
			break;
		
			case SHIELDING:
				if (!input_array[i, SHIELD]) {
					state[i] = UNSHIELDING	
					_inst.sprite_index = scr_get_sprite(_inst.id, "un_shield")
					_inst.image_index = 0
				} else if (point_distance(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]) > obj_input.l_stick_deadzone[i]) {
					state[i] = scr_perform_dodge(_inst, i, 0, point_direction(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]))
				}
			case UNSHIELDING:
				if (_inst.character = GEO) {
					_move_character = 0 //move normally
				} else {
					_move_character = 2 //drift
				}
			break;
		
			case LEDGE_ALT: 
				_move_character = 1 //stop
			break;
		
			case HIT_STUN:
				_move_character = 3 //DI
			break;
			
			case DASH_SLOW: case SPEED_DOWN: 
				_move_character = 0 //move normally
				if (abs(input_array[i, XAXIS]) > obj_input.l_stick_deadzone[i]) { //change direction
					if (_inst.image_xscale != sign(input_array[i, XAXIS])) { //if different direction
						state[i] = GROUNDED //make state grounded so a new dash is performed
						_inst.momentum_x *= -1 //make momentum switch direction
						_inst.image_xscale = sign(input_array[i, XAXIS]) //change image facing direction
					}
				}
			break;
			case JUMP_RISE:
				if (_inst.momentum_y >= 0) {
					state[i] = AIRBORNE	
				}
				if (input_array[i, JUMP]) {
					scr_perform_jump_rise(_inst, i)	
				}
				if (input_array[i, SHIELD]) { //shield or airdodge
					if (_inst.character = GEO) {
						state[i] = scr_perform_shield(_inst, i)	
					} else if (point_distance(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]) > obj_input.l_stick_deadzone[i]) {
						state[i] = scr_perform_dodge(_inst, i, 1, point_direction(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]))
					}
				}
				if (input_array[i, ATTACK]) { //attack
					state[i] = scr_perform_attack(_inst, i, 5, _dir)
				}
				if (input_array[i, SPECIAL]) { //special attack
					state[i] = scr_perform_attack(_inst, i, 3, _dir)
				}
				if (input_array[i, GRAB]) { //grab
					state[i] = scr_perform_grab(_inst, i, 1, _dir)
				}
			case AIR_ATTACK: case FREEFALL:
				_move_character = 4//airborne
			break;
			case SPEED_UP: case DASHING:
				if (input_array[i, SHIELD] and (_inst.character = GEO)) {
					state[i] = scr_perform_shield(_inst, i)	
				}
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
					state[i] = scr_perform_jump_squat(_inst, i, 0)
				}
				_move_character = 0 //move normally
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
				if (abs(input_array[i, XAXIS]) > obj_input.l_stick_deadzone[i]) { //change direction
					_inst.image_xscale = sign(input_array[i, XAXIS])
				}
				if (_inst.image_index >= 1) {
					state[i] = scr_perform_jump(_inst, i, false)	
				}
			break;
		
			case AIRBORNE: 
				if (input_array[i, SHIELD]) { //shield
					if (_inst.character = GEO) {
						state[i] = scr_perform_shield(_inst, i)	
					} else if (point_distance(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]) > obj_input.l_stick_deadzone[i]) {
						state[i] = scr_perform_dodge(_inst, i, 1, point_direction(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]))
					}
				}
				if (input_array[i, ATTACK]) { //attack
					state[i] = scr_perform_attack(_inst, i, 5, _dir)
				}
				if (input_array[i, SPECIAL]) { //special attack
					state[i] = scr_perform_attack(_inst, i, 3, _dir)
				}
				if (input_array[i, GRAB]) { //grab
					state[i] = scr_perform_grab(_inst, i, 1, _dir)
				}
				if (input_array[i, JUMP]) { //jump
					state[i] = scr_perform_jump(_inst, i, 1)
				}
				if (input_array[i, YAXIS] > obj_input.l_stick_deadzone[i]) { //fastfall
					scr_apply_impulse(_inst, i, 270, _inst.weight*_IMPULSE._FASTFALL/100, false)
				}
				_move_character = 4 //airborne
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
	} until (state[i] = _state) //repeat until a change of state does not happen
	
	if (_move_character = 0) { //default move character
		scr_move_character(_inst, i)
	} else { //handle special movement cases
		scr_handle_movement(_inst, i, _move_character)
	}
	
	//check for ground
	if (position_meeting(_inst.x + _inst.momentum_x, _inst.y + _inst.momentum_y, obj_ground)) {
		_inst.momentum_y = 0	
		_inst.y = obj_ground.bbox_top
		jumps[i] = _inst.max_jumps //refresh jumps
		switch (state[i]) {
			case AIRBORNE: case FREEFALL: case AIR_ATTACK:
				state[i] = LANDING //set state
				_inst.sprite_index = scr_get_sprite(_inst, "land")
				_inst.image_index = 0
			break;
		}
	}
	
	
	//wrapping code
	if (_inst.x > room_width) {
		_inst.x = 5	
	}
	if (_inst.x < 0) {
		_inst.x = room_width - 5	
	}

	if (_inst.y > room_height) {
		_inst.y = 5	
	}

	if (abs(_inst.momentum_x) < 0.001) {
		_inst.momentum_x = 0
	}
	
	i++
}  until(i >= global.player_number)