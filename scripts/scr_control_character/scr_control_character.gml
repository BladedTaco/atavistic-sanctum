///@func scr_control_character()
///@desc controls the characters based on movements and states

var i = 0 //initialise the loop counter to 0
var _check_state, _move_character, _dir, _inst, _ex, _ey; //initialise some local variables in memory
do {
	_dir = point_direction(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]) //get direction
	_check_state = true //set base state of variable
	_move_character = 0 //set base state of variable
	_inst = player[i] //get the player object corresponding to the player number
	_ex = _inst.effective_x //store initial effective x difference for shorthand use
	_ey = _inst.effective_y //store initial effective y difference for shorthand use
	if (!instance_exists(_inst)) { exit }
	if (input_array[i, PAUSE]) { //pause or unpause
		global.paused = !global.paused	
	}
	if ((input_array[i, YAXIS] < 0.5) and !input_array[i, ATTACK]) {
		_inst.alarm[1] = 5 
	} //platform drop alarm
	do {
		var _state = state[i]
		switch (state[i]) { //perform actions based on state 
			case CROUCHING:
				if (input_array[i, YAXIS] < 0.5) {
					if (_inst.sprite_index != scr_get_sprite(_inst, "crouch_end")) {
						_inst.sprite_index = scr_get_sprite(_inst, "crouch_end")
						_inst.image_index = 0
					}
				}
				if (input_array[i, ATTACK]) { //attack
					state[i] = scr_perform_attack(_inst, i, input_array[i, TILT], _dir)
				}
				if (input_array[i, SPECIAL]) { //special attacck
					state[i] = scr_perform_attack(_inst, i, 3, _dir)
				}
				_move_character = 2 //drift
			break;
			case GROUNDED: 
				if (input_array[i, YAXIS] > 0.5) {
					_inst.sprite_index = scr_get_sprite(_inst, "crouch")
					_inst.image_index = 0
					state[i] = CROUCHING
				}
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
					_inst.momentum_x /= 2 //halve horizontal momentum
					state[i] = LANDING
					_inst.sprite_index = scr_get_sprite(_inst, "land") 
					_inst.image_index = 0
					with (instance_create(_inst.x + _inst.momentum_x, _inst.y + _inst.momentum_y, obj_dash_effect)) {
						image_xscale = _inst.image_xscale	
					}
				}
			case SPECIAL_ATTACK:
				if (scr_check_for_ground(_inst, _ex, _ey)) {
					_move_character = 4 //airborne
				} else {
					_move_character = 2 //drift
				}
			break;
			case SMASH_ATTACK:
				if (input_array[i, ATTACK] and (_inst.image_index < 2)) {
					obj_input.sticky_attack[i] = true //set sticky attack to true
					if (_inst.alarm[2] >= 0) {
						_inst.image_index = 1
					}
				} else {
					_inst.smash_charge = 1 - (_inst.alarm[2]/GAME_SPEED)
				}
				_move_character = 2 //drift
			break;
			case TILT_ATTACK:
				//allow cancelling a tilt into a smash attack
				if (input_array[i, ATTACK] and (input_array[i, TILT] = SMASH_MOVE)) { //attack
					obj_input.sticky_attack[i] = false
					state[i] = scr_perform_attack(_inst, i, input_array[i, TILT], _dir)
				}
			case LANDING: case DODGING:
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
					_move_character = 1 //stop
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
					if ((_inst.momentum_y >= -0.5) and (!obj_input.sticky_jump[i])) {
						scr_perform_jump(_inst, i, true)
					} else {
						scr_perform_jump_rise(_inst, i)	
					}
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
			case FREEFALL:
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
			case AIR_ATTACK:
				if (input_array[i, YAXIS] > obj_input.l_stick_neutral[i]) { //fastfall
					scr_apply_impulse(_inst, i, 270, _inst.weight*_IMPULSE._FASTFALL/100, false)
				}
				_move_character = 4 //airborne
			break;
		
			case LEDGE: 
				_move_character = 1 //stop
				if (_inst.sprite_index = scr_get_sprite(_inst, "ledge")) {
					state[i] = scr_perform_ledge(_inst, i, 0)	
				}
				if (_inst.sprite_index = scr_get_sprite(_inst, "ledge_hold")) {
					if (input_array[i, SHIELD]) { //roll
						if (_inst.character != GEO) {
							state[i] = scr_perform_ledge(_inst, i, 2)	
						}
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
				}
			break;
			
			case HELPLESS:
				if (_inst.alarm[4] > 6) { //if a large time left on invulnerability alarm
					_inst.alarm[4] = 5 //end invulnerability alarm in 6 frames
				}
				_move_character = 4 //airborne
				if (point_distance(0, 0, _inst.momentum_x, _inst.momentum_y) <= 3) {
					if (scr_check_for_ground(_inst)) { //grounded
						state[i] = GROUNDED
						_inst.sprite_index = scr_get_sprite(_inst, "idle")
						_inst.image_index = 0
					} else {
						state[i] = AIRBORNE
						_inst.sprite_index = scr_get_sprite(_inst, "air_move")
						_inst.image_index = 0
					}
				}
			break;

			case TECHING: 
				_move_character = 5 //momentum delay
				if (input_array[i, JUMP] and !obj_input.sticky_jump[i]) { //jump
					_inst.momentum_x = 0
					_inst.momentum_y = 0
					_inst.inertial = true
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
	if ((_move_character != 5) and (state[i] != HELPLESS) and (state[i] != HIT_STUN)) {
		if (scr_check_for_ground(_inst, _ex, _ey) and !(state[i] = LEDGE) and !(state[i] = LEDGE_ALT)) {	
			var l = max(ceil(2*point_distance(0, 0, _inst.momentum_x, _inst.momentum_y)/GROUND_HEIGHT), 1)
			var _xx = _inst.x 
			var _yy = _inst.y 
			repeat (l) {
				_xx += _inst.momentum_x/l
				_yy += _inst.momentum_y/l
				var _ground = global.ground
				global.ground = noone
				if (instance_exists(_ground)) { //if there is ground to collide with
					var _d = degtorad(angle_difference(_inst.image_angle, _ground.image_angle))
					if ((abs(_ex) + abs(_ey) > 0) or (abs(_d) != 0)) { //if position is offset and rotated
						//rotate position around that offset 
						_xx = (-_ex)*cos(_d) - (-_ey)*sin(_d) + (_ex + _xx) //rotate around effective x
						_yy = (-_ex)*sin(_d) + (-_ey)*cos(_d) + (_ey + _yy) //rotate around effective y
					}
					_inst.image_angle = _ground.image_angle 
					if (scr_point_in_rec(_xx + _ex, _yy + _ey, _ground.hurtbox)) { //in the top of the ground hitbox
						_inst.momentum_y = 0 //set vertical momentum to 0
						var _d = _inst.image_angle
						while (scr_point_in_rec(_xx + _ex, _yy + _ey, _ground.hurtbox)) {
							_yy -= 0.25
						}
						_inst.alarm[0] = GAME_SPEED //set ledge alarm
						jumps[i] = _inst.max_jumps //refresh jumps
						switch (state[i]) {
							case AIRBORNE: case FREEFALL: case AIR_ATTACK:
								_inst.spawning = false //set the instance to no longer spawning
								state[i] = LANDING //set state
								_inst.sprite_index = scr_get_sprite(_inst, "land") //set to land sprite
								_inst.image_index = 0 //set to first sub-image
								_inst.momentum_x /= 2 //halve horizontal momentum
							break;
						}
						break; //break the repeat loop if the ground is found
					}
				}
			}
			_inst.x = _xx //update instance position
			_inst.y = _yy //update instance position
		} else {
			if (_inst.image_angle != 0) and (scr_check_for_ground(_inst, -_inst.momentum_x*2 + _ex, _ey)) {
				while (!scr_check_for_ground(_inst, _ex, _ey)) {
					_inst.y += 0.25
				}
			} else { //absolutely no ground found
				_inst.image_angle = 0
				switch (state[i]) { //if in a certain state, make character airborne
					case WALKING: case RUNNING: case CROUCHING: case SPEED_UP: case DASHING:
					case DASH_SLOW: case SPEED_DOWN:
						state[i] = AIRBORNE
						_inst.sprite_index = scr_get_sprite(_inst, "air_move")
						_inst.image_index = 0
					break;
				}
			}
		}
	}

	//wrapping code
	if (_inst.x > room_width) {
		_inst.x -= 1
	}
	if (_inst.x < 0) {
		_inst.x += 1
	}

	if (_inst.y > room_height) {
		_inst.y -= 1
	}
	if (_inst.y < 0) {
		_inst.y += 1
	}

	//floor momentum if almost nonexistant
	if (abs(_inst.momentum_x) < 0.001) {
		_inst.momentum_x = 0
	}
	
	i++
}  until(i >= global.player_number)