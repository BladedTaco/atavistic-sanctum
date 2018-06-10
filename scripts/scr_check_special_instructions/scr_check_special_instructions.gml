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
		}
	break;
}