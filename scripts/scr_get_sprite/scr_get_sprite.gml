///@func scr_get_sprite(character_number, string)
///@param character_number - the number assigned to the character type
///@param string - the string identifier of the sprite (everything after character 7)
///@desc returns the sprite id of a specific sprite given the character and animation type


var i, ret; //initialise variable

switch (argument[0]) { //check charater
	case BAL: i = "spr_bal_" break;
	case GEO: i = "spr_geo_" break;
	case ETH: i = "spr_eth_" break;
	case MAC: i = "spr_mac_" break;
}

ret = asset_get_index(i + argument[1])
if (ret = -1) { //if nonexistant sprite
	//check for special cases
	switch (argument[0]) {
		case ETH:
			if (string_copy(argument[1], 1, 4) = "tilt") { //smash attack
				ret = asset_get_index(string_replace(argument[1], "tilt", "smash"))
				if (ret != -1) { return ret }
			}
		break;
	}	
	
	return -1 //if script still running, return nonexistant sprite
} else { //sprite exists
	return ret //return the sprite
}