///@func scr_check_special_instruction(type)
///@param type - the type of current situation (0 1) (animation_end step)
///@desc checks for any special cases where code needs to be executed, returns whether normal code should be executed
var _xx = 0 //effective x
var _yy = 0 //effective y
var _gx = 0 //grab x
var _gy = 0 //grab y
var _xs = -1 //relative image_xscale for grabs
var _d = degtorad(-image_angle)
switch (argument[0]) {
	case 0: //animation end
		switch (character) {
			case BAL:
				switch (sprite_index) {
					case spr_bal_smash_forward:
						x += effective_x
						y += effective_y
						effective_x = 0
						effective_y = 0
					break;
					case spr_bal_special_down:
						_yy = -25
						_xx = 2
						obj_match_handler.state[player_number] = AIRBORNE
						sprite_index = spr_bal_air_move
						image_index = 0
					break;
					case spr_bal_ledge_attack:
						_xx = 27
					break;
					case spr_bal_ledge_roll:
						_xx = 103
					break;
					case spr_bal_ledge_jump:
						_xx = 4
						_yy = -7
						scr_apply_impulse(id, player_number, 90, _IMPULSE._JUMP/100, false)
						obj_match_handler.state[player_number] = JUMP_RISE
						image_index = 0
						sprite_index = scr_get_sprite(id, "air_move")
					break;
					case spr_bal_ledge_grab:
						_xx = 69
					break;
					case spr_bal_special_up:
						recovered = true //make further aerial recoveries useless
					break;
				}
			break;
			
			case MAC:
				switch(sprite_index) {
					case spr_mac_ledge_attack:
						_xx = 22
					break;
					case spr_mac_ledge_grab:
						_xx = 66
					break;
					case spr_mac_ledge_jump:
						_xx = -12
						_yy = 17
						scr_apply_impulse(id, player_number, 90, _IMPULSE._JUMP/100, false)
						obj_match_handler.state[player_number] = JUMP_RISE
						image_index = 0
						sprite_index = scr_get_sprite(id, "air_move")
					break;
					case spr_mac_ledge_roll:
						_xx = 97
					break;
					case spr_mac_special_up:
						//rotate position to appear to have a more natural transition
						_gx = (bbox_left + bbox_right)/2
						_gy = (bbox_top + bbox_bottom)/2
						_xx = x - _gx
						_yy = y - _gy
						x = _xx*cos(-_d) - _yy*sin(-_d) + _gx
						y = _xx*sin(-_d) - _yy*cos(-_d) + _gy
						_gx = 0; _gy = 0; _xx = 0; _yy = 0; //reset variables
						obj_match_handler.state[player_number] = scr_perform_freefall(id, player_number)
						recovered = true
					break;
				}
			break;
			
			case GEO:
				switch (sprite_index) {
					case spr_geo_special_down_start:
						sprite_index = spr_geo_special_down_sustain
						image_index = 0
						return false //dont execute normal code
					break;
					case spr_geo_special_down_sustain:
						//allow repeats of the move
						sub_recovery++
						if (!obj_input.input_array[player_number, SPECIAL] or (sub_recovery >= 3)) {
							sprite_index = spr_geo_special_down_end
							image_index = 0
							obj_match_handler.jumps[player_number] -- //take away a jump
							sub_recovery = 0
						}
						return false //dont execute normal code
					break;
					case spr_geo_special_neutral:
						hitstun = 10;
					break;
					case spr_geo_special_up:
						recovered = true
					break;
					case spr_geo_flurry:
						sub_recovery++ //increment sub recovery to allow repeats of the move
						if (obj_input.input_array[player_number, ATTACK] and (sub_recovery <= 5)) { //and holding attack still
							return false; //let animation loop
						}
						sub_recovery = 0 //reset sub recovery if the above statement fails
					break;
					
					case spr_geo_ledge_jump:
						_xx = -22
						_yy = 16
						scr_apply_impulse(id, player_number, 90, _IMPULSE._JUMP/100, false)
						obj_match_handler.state[player_number] = JUMP_RISE
						image_index = 0
						sprite_index = scr_get_sprite(id, "air_move")
					break;
					case spr_geo_ledge_grab:
						_xx = 23
						_yy = -1
					break;
					case spr_geo_ledge_attack:
						_xx = 1
						_yy = -1
					break;
				}	
			break;
			
			case ETH:
				switch (sprite_index) {
					case spr_eth_special_up:
						recovered = true
					break;
					case spr_eth_smash_up:
						_yy = -67
						if (instance_exists(obj_eth_platform)) {
							instance_destroy(obj_eth_platform)	
						}
						global.eth_angle = image_angle
						instance_create(x - _yy*sin(_d), y + _yy*cos(_d), obj_eth_platform)
					break;
					case spr_eth_throw_forward: case spr_eth_throw_up: case spr_eth_throw_down: case spr_eth_throw_back:
						if (instance_exists(child_object)) { instance_destroy(child_object) }
					break;
				}
			break;
		}
		_xx *= image_xscale
		x += _xx*cos(_d) - _yy*sin(_d)
		y += _xx*sin(_d) + _yy*cos(_d)
	break;
	
	case 1: //step
		switch (character) {
			case BAL:
				switch (sprite_index) {
					case spr_bal_special_up:
						if (!recovered) { //if able to recover
							scr_apply_impulse(id, player_number, 90, _IMPULSE._BAL_U_SPEC/100, false)
						}
					break;
					case spr_bal_smash_forward:
						switch (floor(image_index)) {
							case 3: _xx = 3; break;
							case 4: _xx = 34; break;
							case 5: _xx = 47; break;
							case 6: _xx = 60; break;
							case 7: _xx = 69; break;
							case 8: _xx = 73; break;
							case 9: _xx = 75; break;
							case 10: _xx = 76; break;
							case 11: _xx = 76; break;
							case 12: _xx = 83; break;
							case 13: _xx = 83; break;
							case 14: _xx = 88; break;
						}
					break;
					case spr_bal_grab_hold:
						_xs = -1
						_gx = 23
						_gy = -9
					break;
					case spr_bal_grab_jab:
						_xs = -1
						_gx = 23
						_gy = -9
					break;
					case spr_bal_throw_forward:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 23; _gy = -9; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
					case spr_bal_throw_up:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 23; _gy = -9; break;
							case 1: _gx = 21; _gy = -20; break;
							case 2: _gx = 10; _gy = -29; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
					case spr_bal_throw_down:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 23; _gy = -9; break;
							case 1: _gx = 25; _gy = 0; break;
							case 2: _gx = 21; _gy = 7; break;
							case 3: _gx = 15; _gy = 13; break;
							case 4: _gx = 14; _gy = 14; break;
							case 5: _gx = 9; _gy = 15; break;
							case 6: _gx = 9; _gy = 15; break;
							case 7: _gx = 9; _gy = 15; break;
							case 8: _gx = 9; _gy = 15; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
					case spr_bal_throw_back:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 23; _gy = -9; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
				}
			break;
			
			case MAC:
				switch (sprite_index) {
					case spr_mac_tilt_forward: case spr_mac_special_forward:
						scr_apply_impulse(id, player_number, point_direction(0, 0, image_xscale, 0), _IMPULSE._MAC_SLIDE/100, false)
					break;
					
					case spr_mac_tilt_down: 
						scr_apply_impulse(id, player_number, point_direction(0, 0, image_xscale, 0), _IMPULSE._MAC_SLIDE_SMALL/100, false)
					break;
					
					case spr_mac_special_up:
						if (image_speed > 0) {
							momentum_x = lengthdir_x((image_number - floor(image_index))/3, image_angle + 90)
							momentum_y = lengthdir_y((image_number - floor(image_index))/3, image_angle + 90)
						} else {
							momentum_x = 0
							momentum_y = 0
						}
					break;
					
					case spr_mac_grab_hold:
						_xs = -1; _gx = 4; _gy = -35;
					break;
					
					case spr_mac_throw_forward:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 4; _gy = -35; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
					
					case spr_mac_throw_up:
						_xs = -1; _gx = 4; _gy = -35; //set grab
						scr_apply_impulse(id, player_number, 90, _IMPULSE._MAC_U_THROW/100, false) //apply impulse
					break;
					
					case spr_mac_throw_down:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 4; _gy = -35; break;
							case 1: _gx = 3; _gy = -32; break;
							case 2: _gx = 1; _gy = -31; break;
							case 3: _gx = -4; _gy = -24; break;
							case 4: _gx = -14; _gy = -12;
								if (!scr_check_for_ground()) {
									image_index = 4
									alarm[5] = GAME_SPEED
									scr_apply_impulse(id, player_number, 270, _IMPULSE._MAC_D_THROW/100, false) //apply impulse
								}
							break;
							case 5: _gx = -20; _gy = 0; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
					
					case spr_mac_throw_back:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 4; _gy = -35; break;
							case 1: _gx = 3; _gy = -32; break;
							case 2: _gx = 1; _gy = -31; break;
							case 3: _gx = -4; _gy = -24; break;
							case 4: _gx = -14; _gy = -12; break;
							case 5: _gx = -20; _gy = 0; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
				}
			break;
			
			case GEO:
				switch(sprite_index) {
					case spr_geo_special_up:
						if (!recovered) {
							scr_apply_impulse(id, player_number, 90, _IMPULSE._GEO_U_SPEC/100, false)
						}
					break;
					
					case spr_geo_special_down_sustain:
						if (obj_match_handler.jumps[player_number] >= 0) {
							scr_apply_impulse(id, player_number, 90, _IMPULSE._GEO_D_SPEC/100, false)
						}
					break;
					
					case spr_geo_grab_hold:
						_xs = -1; _gx = 31; _gy = -31
					break;
					case spr_geo_throw_forward: case spr_geo_throw_up:
						_xs = -1
						if (floor(image_index) < 5) {
							_gx = 31; _gy = -31;
						} else {
							_gx = 0; _gy = 0;
						}
					break;
					case spr_geo_throw_down: case spr_geo_throw_back:
						_xs = -1; _gx = 0; _gy = 0;
					break;
				}
			break;
			
			case ETH:
				switch(sprite_index) {
					case spr_eth_special_up:
						if (!recovered) {
							scr_apply_impulse(id, player_number, 90, _IMPULSE._GEO_U_SPEC/100, false)
						}
					break;
					
					case spr_eth_special_neutral:
						if (sub_recovery < 14) {
							if (floor(image_index) = 1) {
								sub_recovery ++
								global.bbox[10] = id
								_xx = 19*image_xscale; _yy = -28 + (image_index-1)*6 - 3
								global.eth_angle = image_angle + point_direction(0, -28, 10*image_xscale, _yy)
								instance_create(x + _xx*cos(_d) - _yy*sin(_d), y + _xx*sin(_d) + _yy*cos(_d), obj_eth_projectile)
								_xx = 0; _yy = 0
							}
						}
					break;
					
					case spr_eth_special_down:
						if (floor(image_index) = 3) {
							image_index = 4
							with (obj_player) {
								if !(scr_check_for_ground(id)) {
									var _inst = collision_line(x, y, x, room_height, obj_ground, true, false)
									if (instance_exists(_inst)) {
										y = _inst.bbox_top - 2 //move to top of bounding box
										do { //move down until the ground is found
											y -= 1
										} until (scr_check_for_ground(id)) 
									}
								}
							}
						}
					break;
					case spr_eth_throw_forward:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 30; _gy = -20; break;
							case 1: _gx = 35; _gy = -20; break;
							case 2: _gx = 40; _gy = -20; break;
							case 3: _gx = 45; _gy = -20; break;
							case 4: _gx = 50; _gy = -20; break;
							case 5: _gx = 55; _gy = -20; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
					case spr_eth_throw_up:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 30; _gy = -20; break;
							case 1: _gx = 30; _gy = -25; break;
							case 2: _gx = 30; _gy = -30; break;
							case 3: _gx = 30; _gy = -35; break;
							case 4: _gx = 30; _gy = -40; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
					case spr_eth_throw_down:
						_xs = -1
						switch (floor(image_index)) {
							case 0: _gx = 30; _gy = -20; break;
							case 1: _gx = 30; _gy = -25; break;
							case 2: _gx = 30; _gy = -30; break;
							case 3: _gx = 30; _gy = -35; break;
							case 4: _gx = 30; _gy = -40; break;
							case 5: _gx = 30; _gy = -35; break;
							case 6: _gx = 30; _gy = -30; break;
							case 7: _gx = 30; _gy = -25; break;
							case 8: _gx = 30; _gy = -20; break;
							default: _gx = 0; _gy = 0; break;
						}
					break;
					case spr_eth_throw_back:
						if (image_index <= 39) {
							switch (floor(image_index) mod 9) {
								case 0: _gx = 15; _gy = -20; _xs = -1; break;
								case 1: _gx = 0; _gy = -20; _xs = -1; break;
								case 2: _gx = -15; _gy = -20; _xs = 1; break;
								case 4: _gx = -30; _gy = -20; _xs = 1; break;	
								case 5: _gx = -15; _gy = -20; _xs = 1; break;
								case 6: _gx = 0; _gy = -20; _xs = -1; break;		
								case 7: _gx = 15; _gy = -20; _xs = -1; break;	
								case 8: _gx = 30; _gy = -20; _xs = -1; break;
							}
							_gy -= floor(image_index)*3
						} else { _gx = 0; _gy = 0; }
					break;
				}
			break;
			
		}
		_gx *= image_xscale
		_xx *= image_xscale
		if (abs(_gx) + abs(_gy) > 0) {
			if (instance_exists(attacker)) {
				_gx += irandom_range(-2, 2)*attacker.wiggle //apply wiggle if wiggling
				attacker.wiggle = false //reset wiggle
				//translate coodinates around image rotation and flips
				attacker.x = x + (_gx*cos(_d) - _gy*sin(_d))
				attacker.y = y + (_gx*sin(_d) + _gy*cos(_d))
				attacker.image_xscale = _xs*image_xscale
				attacker.image_angle = image_angle
			} else {
				alarm[5] = 0	
			}	
		}
		if !((_xx = 0) and (_yy = 0)) { //skip calculation if no difference in effective x y
			effective_x = _xx*cos(_d) - _yy*sin(_d)
			effective_y = _xx*sin(_d) + _yy*cos(_d)
		}
	break;
}

return true //return true if false is not yet returned