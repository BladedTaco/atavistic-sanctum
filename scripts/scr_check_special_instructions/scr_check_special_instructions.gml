///@func scr_check_special_instruction()
///@desc checks for any special cases where code needs to be executed on animation end
var _xx = 0
var _yy = 0
switch (character) {
	case BAL:
		switch (sprite_index) {
			case spr_bal_smash_forward:
				_xx = 88*image_xscale
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

var _d = degtorad(-image_angle)

x += _xx*cos(_d) - _yy*sin(_d)
y += _xx*sin(_d) + _yy*cos(_d)
