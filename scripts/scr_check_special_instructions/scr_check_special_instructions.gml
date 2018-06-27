///@func scr_check_special_instruction(type)
///@param type - the type of current situation (0 1) (animation_end step)
///@desc checks for any special cases where code needs to be executed on animation end
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
					case spr_mac_tilt_down: case spr_mac_tilt_forward: case spr_mac_special_forward:
						scr_apply_impulse(id, player_number, point_direction(0, 0, image_xscale, 0), _IMPULSE._MAC_SLIDE/100, false)
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
