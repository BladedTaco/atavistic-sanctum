///@func scr_get_smash_frame(player, sprite)
///@param player - the player perfroming the smash attack
///@param sprite - the sprite of the smash attack
///@desc sets the appropriate smash charge frame for the attack
switch (argument[0].character) {
	case BAL:
		argument[0].smash_frame = 1 //simple as all for bal are 1
	break;
	
	case MAC:
		switch (argument[1]) { //switch of sprite
			case spr_mac_smash_forward: argument[0].smash_frame = 4; break;
			case spr_mac_smash_down: argument[0].smash_frame = 11; break;
			case spr_mac_smash_up: argument[0].smash_frame = 2; break;
		}
	break;
	
	case GEO:
		switch (argument[1]) { //switch of sprite
			case spr_geo_smash_forward: argument[0].smash_frame = 1; break;
			case spr_geo_smash_down: argument[0].smash_frame = 3; break;
			case spr_geo_smash_up: argument[0].smash_frame = 1; break;
		}
	break;
	
	case ETH:
		switch (argument[1]) { //switch of sprite
			case spr_eth_smash_forward: argument[0].smash_frame = 1; break;
			case spr_eth_smash_down: argument[0].smash_frame = 4; break;
			case spr_eth_smash_up: argument[0].smash_frame = 3; break;
		}
	break;
}