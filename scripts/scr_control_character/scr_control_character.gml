///@func scr_control_character()
///@desc controls the characters based on movements and states

var i = 0 //initialise the loop counter to 0
var _check_state, _move_character, _dir, _inst, _ex, _ey; //initialise some local variables in memory
do {
	_dir = point_direction(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]) //get direction
	_check_state = true //set base state of variable
	_move_character = 0 //set base state of variable
	_inst = player[i] //get the player object corresponding to the player number
	/* DEPRECATED CODE THAT MAY NEED TO BE RE ADDED
		while (!instance_exists(_inst)) {
			if (i = global.player_number) {
				return -1 //return an error, this should do nothing
			}
			for (var o = i; o < global.player_number - 1; o++) {
				player[o] = player[o+1]
			}
			player[global.player_number - 1] = noone
			global.player_number -= 1
		}
	*/
	_ex = _inst.effective_x //store initial effective x difference for shorthand use
	_ey = _inst.effective_y //store initial effective y difference for shorthand use
	//check exit conditions in case of false input
	if (i >= global.player_number) { exit }
	if (!instance_exists(_inst)) { i++; continue }
	if (_inst.dead) { i++; continue }
	if (input_array[i, PAUSE]) { //pause or unpause
		global.paused = !global.paused	
	}
	if ((input_array[i, YAXIS] < 0.5) or (state[i] = SMASH_ATTACK) or (state[i] = SPECIAL_ATTACK) or (state[i] = TILT_ATTACK)) {
		_inst.alarm[1] = 5 
	} //platform drop alarm
	do {
		var _state = state[i]
		switch (state[i]) { //perform actions based on state 
			case DEAD: with (_inst) { image_alpha = 0; image_speed = 0; x = -1000; y = -1000; spawning = true; dead = true } break;
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
					if (_inst.character != ETH) {
						_inst.sprite_index = scr_get_sprite(_inst, "crouch")
						_inst.image_index = 0
						state[i] = CROUCHING
					}
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
				if (_inst.sprite_index = spr_mac_special_up) {
					_move_character = 6 //nothing
				} else {
					//allow movement if in air
					if (scr_check_for_ground(_inst, _ex, _ey)) {
						_move_character = 2 //drift
					} else {
						_move_character = 4 //airborne
					}
				}
			break;
			case SMASH_ATTACK:
				if (input_array[i, ATTACK] and (floor(_inst.image_index) = _inst.smash_frame)) {
					obj_input.sticky_attack[i] = true //set sticky attack to true
					if (_inst.alarm[2] >= 0) {
						_inst.image_index = _inst.smash_frame
					}
				} else {
					if (floor(_inst.image_index) > _inst.smash_frame) {
						if (_inst.smash_charge <= 0) {
							_inst.smash_charge = 1 - (_inst.alarm[2]/GAME_SPEED)
							_inst.alarm[2] = -1
						}
					}
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
				if (_inst.character = GEO) {
					if (!input_array[i, SHIELD]) {
						state[i] = UNSHIELDING	
					}
					if (abs(input_array[i, XAXIS]) > obj_input.l_stick_deadzone[i]) { //change direction
						_inst.image_xscale = sign(input_array[i, XAXIS])
					}
				} else {
					if (!input_array[i, SHIELD]) {
						state[i] = UNSHIELDING	
						_inst.sprite_index = scr_get_sprite(_inst.id, "un_shield")
						_inst.image_index = 0
					} else if (point_distance(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]) > obj_input.l_stick_deadzone[i]) {
						state[i] = scr_perform_dodge(_inst, i, 0, point_direction(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]))
					}
				}
			case UNSHIELDING:
				if (_inst.character = GEO) {
					_move_character = -1 //shield walk
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
				if (abs(input_array[i, XAXIS]) > obj_input.l_stick_deadzone[i]) { //change direction
					if (_inst.image_xscale != sign(input_array[i, XAXIS])) { //if different direction
						state[i] = GROUNDED //make state grounded so a new dash is performed
						_inst.momentum_x *= -1 //make momentum switch direction
						_inst.image_xscale = sign(input_array[i, XAXIS]) //change image facing direction
					}
				}
			case SPEED_UP: case DASHING:
				if (input_array[i, SHIELD] and (_inst.character = GEO)) {
					state[i] = scr_perform_shield(_inst, i)	
				}
				_move_character = 0 //move normally
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
		
			case GRABBING: case TAUNTING:
				_move_character = 2 //drift
			break;
		
			case GRABBED:
				_move_character = 1; //stop
				var _release = false
				if (instance_exists(_inst.attacker)) { //if the grabber exists
					if (_inst.attacker.alarm[5] > GAME_SPEED/4) { //if more than 1/4 of a second left in the grab
						if (input_array[i, TILT] = SMASH_MOVE) { //if smashing stick
							_inst.attacker.alarm[5] -= 1 //reduce alarm	
							_inst.wiggle = true //set wiggle to true
						}
						//reduce alarm by 3 on a new button press
						if (!obj_input.sticky_attack[i] and input_array[i, ATTACK]) {
							_inst.attacker.alarm[5] -= 3 
							_inst.wiggle = true //set wiggle to true
							obj_input.sticky_attack[i] = true //set sticky to true
						}
						if (!obj_input.sticky_special[i] and input_array[i, SPECIAL]) {
							_inst.attacker.alarm[5] -= 3
							_inst.wiggle = true //set wiggle to true
							obj_input.sticky_special[i] = true //set sticky to true
						}
						if (!obj_input.sticky_jump[i] and input_array[i, JUMP]) {
							_inst.attacker.alarm[5] -= 3
							_inst.wiggle = true //set wiggle to true
							obj_input.sticky_jump[i] = true //set sticky to true
						}
					}
					if (_inst.attacker.attacker != _inst) {
						_release = true	
					}
				} else { _release = true }
				if (_release) {
					state[i] = AIRBORNE
					_inst.sprite_index = scr_get_sprite(_inst, "air_move")
					_inst.image_index = 0
				}
			break;
			
			case HOLDING:
				_move_character = 2//drift
				if (_inst.sprite_index = scr_get_sprite(_inst, "grab_hold") or ((_inst.character = ETH) and (_inst.child_object.state = 1))) {
					if (input_array[i, TILT] = SMASH_MOVE) { 
						_inst.alarm[5] = GAME_SPEED //set grab release alarm to 1 second
						state[i] = scr_perform_throw(_inst, i, point_direction(0, 0, input_array[i, XAXIS], input_array[i, YAXIS]))
					}
					if (input_array[i, ATTACK] and !obj_input.sticky_attack[i]) { //grab jab
						state[i] = scr_perform_attack(_inst, i, 6, 0)
						if (_inst.alarm[5] > GAME_SPEED/5) {
							_inst.alarm[5] -= GAME_SPEED/5 //reduce grab alarm
						}
					}
				}
			break;
		}
	} until (state[i] = _state) //repeat until a change of state does not happen
	
	if (_move_character = 0) { //default move character
		scr_move_character(_inst, i)
	} else { //handle special movement cases
		scr_handle_movement(_inst, i, _move_character)
	}		
		
	if (!_inst.dead) {
		//check for ground
		if ((_move_character < 5) and (state[i] != HELPLESS) and (state[i] != HIT_STUN)) {
			if (scr_check_for_ground(_inst, _ex, _ey) and !(state[i] = LEDGE) and !(state[i] = LEDGE_ALT)) {	
				var j = 100
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
								j--
								if (j < 0) { break }
							}
							_inst.alarm[0] = GAME_SPEED //set ledge alarm
							jumps[i] = _inst.max_jumps //refresh jumps
							_inst.recovered = false //refresh recovery
							switch (state[i]) {
								case AIRBORNE: case FREEFALL: case AIR_ATTACK:
									_inst.image_speed = 1 //end any hitlag
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
				if (_inst.sprite_index != spr_eth_smash_up) {
					if (_inst.image_angle != 0) and (scr_check_for_ground(_inst, -_inst.momentum_x*2 + _ex, _ey)) {
						l = 100
						while (!scr_check_for_ground(_inst, _ex, _ey) and (l > 0)) {
							l--
							_inst.y += 0.25
						}
					} else { //absolutely no ground found
					
						switch (state[i]) { //if in a certain state, make character airborne
							case WALKING: case RUNNING: case CROUCHING: case SPEED_UP: case DASHING:
							case DASH_SLOW: case SPEED_DOWN: case GROUNDED:
								_inst.image_angle = 0
								state[i] = AIRBORNE
								_inst.sprite_index = scr_get_sprite(_inst, "air_move")
								_inst.image_index = 0
							break;
							case HELPLESS: case HIT_STUN: break;
							default: _inst.image_angle = 0; break;
						}
					}
				}
			}
		}

		//floor momentum if almost nonexistant
		if (abs(_inst.momentum_x) < 0.001) {
			_inst.momentum_x = 0
		}
	
		//check for death
		if !(position_meeting(_inst.x + _inst.effective_x, _inst.y + _inst.effective_y, obj_blast_zone)) { //if (not in play area)
			//if not(not helpless, and above the blast zone)
			if !((state[i] != HELPLESS) and (position_meeting(_inst.x + _inst.effective_x, obj_blast_zone.y, obj_blast_zone)) and (_inst.y < 0)) {
				_inst.stocks -= 1
				if (instance_exists(_inst.attacker)) {
					obj_results.kills[_inst.attacker.player_number, array_length_2d(obj_results.kills, _inst.attacker.player_number)] = _inst.player_number
					obj_results.deaths[_inst.player_number, array_length_2d(obj_results.deaths, _inst.player_number)] = _inst.attacker.player_number
				} else {
					obj_results.deaths[_inst.player_number, array_length_2d(obj_results.deaths, _inst.player_number)] = _inst.player_number
				}
				with (instance_create(clamp(_inst.x, 0, room_width), clamp(_inst.y, 0, room_height), obj_death_effect)) {
					player_col = _inst.player_col
				}
				if (_inst.stocks > 0) {
					with (obj_spawn_point) { if (number = i) { var o = id } } //get spawn point position
					with(_inst) {
						momentum_x = 0
						momentum_y = 0
						draw_count = 0
						image_alpha = 0
						x = o.x
						y = o.y
						sprite_index = scr_get_sprite(id, "hurt_down")
						spawning = true
						other.state[i] = FREEFALL
					}
				} else {
					obj_results.placing[array_length_1d(obj_results.placing)] = _inst.player_number
					_inst.placing = array_length_1d(obj_results.placing) - 1
					_inst.dead = true
					state[i] = DEAD
					if (array_length_1d(obj_results.placing) >= global.player_number) {
						scr_end_game(0)
						exit
					}
				}
			}
		}
	}
	
	i++
}  until(i >= global.player_number)