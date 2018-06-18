///@func scr_check_special_instruction(type)
///@param type - the type of current situation (0 1) (animation_end step)
///@desc checks for any special cases where code needs to be executed on animation end
var _xx = 0
var _yy = 0
var _d = degtorad(-image_angle)
switch (argument[0]) {
	case 0: //animation end
		switch (character) {
			case BAL:
				switch (sprite_index) {
					case spr_bal_smash_forward:
						x = effective_x
						y = effective_y
					break;
					case spr_bal_special_down:
						_yy = -25
						_xx = 2*image_xscale
						obj_match_handler.state[player_number] = AIRBORNE
						sprite_index = spr_bal_air_move
						image_index = 0
					break;
					case spr_bal_ledge_attack:
						_xx = 27*image_xscale
					break;
					case spr_bal_ledge_roll:
						_xx = 103*image_xscale
					break;
					case spr_bal_ledge_jump:
						_xx = 4*image_xscale
						_yy = -7
						scr_apply_impulse(id, player_number, 90, _IMPULSE._JUMP/100, false)
						obj_match_handler.state[player_number] = JUMP_RISE
						image_index = 0
						sprite_index = scr_get_sprite(id, "air_move")
					break;
					case spr_bal_ledge_grab:
						_xx = 69*image_xscale
					break;
				}
			break;
		}
		x += _xx*cos(_d) - _yy*sin(_d)
		y += _xx*sin(_d) + _yy*cos(_d)
	break;
	
	case 1: //step
		switch (character) {
			case BAL:
				switch (sprite_index) {
					case spr_bal_special_up:
						scr_apply_impulse(id, player_number, 90, _IMPULSE._BAL_U_SPEC/100, false)
					break;
					case spr_bal_smash_forward:
						switch (floor(image_index)) {
							case 3: _xx = 3*image_xscale; break;
							case 4: _xx = 34*image_xscale; break;
							case 5: _xx = 47*image_xscale; break;
							case 6: _xx = 60*image_xscale; break;
							case 7: _xx = 69*image_xscale; break;
							case 8: _xx = 73*image_xscale; break;
							case 9: _xx = 75*image_xscale; break;
							case 10: _xx = 76*image_xscale; break;
							case 11: _xx = 76*image_xscale; break;
							case 12: _xx = 83*image_xscale; break;
							case 13: _xx = 83*image_xscale; break;
							case 14: _xx = 88*image_xscale; break;
						}
					break;
				}
			break;
		}
		effective_x = _xx*cos(_d) - _yy*sin(_d) + x
		effective_y = _xx*sin(_d) + _yy*cos(_d) + y
	break;
}
