///@func scr_check_special_instruction()
///@desc checks for any special cases where code needs to be executed on animation end
switch (character) {
	case BAL:
		switch (sprite_index) {
			case spr_bal_smash_forward:
				x += 88*image_xscale
			break;
			case spr_bal_special_down:
				y -= 25
				x -= 2*image_xscale
				obj_match_handler.state[player_number] = AIRBORNE
				sprite_index = spr_bal_air_move
				image_index = 0
			break;
			case spr_bal_ledge_attack:
				x += 27*image_xscale
				y -= 1
			break;
			case spr_bal_ledge_roll:
				x += 103*image_xscale
				y -= 1
			break;
			case spr_bal_ledge_jump:
				x -= 4*image_xscale
				y -= 7
				scr_apply_impulse(id, player_number, 90, _IMPULSE._JUMP/100, false)
				obj_match_handler.state[player_number] = JUMP_RISE
				image_index = 0
				sprite_index = scr_get_sprite(id, "air_move")
			break;
			case spr_bal_ledge_grab:
				x += 69*image_xscale
				y -= 1
			break;
		}
	break;
}