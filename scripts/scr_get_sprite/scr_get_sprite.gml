///@func scr_get_sprite(character_number, string)
///@param object - the number assigned to the character type
///@param string - the string identifier of the sprite (everything after character 7)
///@desc returns the sprite id of a specific sprite given the character and animation type


var i, ret; //initialise variable

switch (argument[0].character) { //check charater
	case BAL: i = "spr_bal_" break;
	case GEO: i = "spr_geo_" break;
	case ETH: i = "spr_eth_" break;
	case MAC: i = "spr_mac_" break;
}

//show_debug_message(string(i + argument[1]))
ret = asset_get_index(string(i + argument[1]))
if (ret = -1) { //if nonexistant sprite
	//check for special cases
	if (string_copy(argument[1], 1, 11) = "dash_attack") { //jab attack
		ret = asset_get_index(i + "smash_forward")	
	}
	if (string_copy(argument[1], 1, 3) = "jab") { //jab attack
		ret = asset_get_index(i + "jab_" + string(argument[0].jab))	
	}
	if (string_copy(argument[1], 1, 10) = "smash_back") { //jab attack
		ret = asset_get_index(i + "smash_forward")	
	}
	if (string_copy(argument[1], 1, 9) = "tilt_back") { //jab attack
		ret = asset_get_index(i + "tilt_forward")	
	}
	if (string_copy(argument[1], 1, 8) = "grab_jab") { //grab jab
		ret = asset_get_index(i + "grab_jab")	
	}
	switch (argument[0].character) { //check for character specific special cases
		case ETH:
			if (string_copy(argument[1], 1, 4) = "tilt") { //smash attack
				ret = asset_get_index(string_replace(argument[1], "tilt", "smash"))
				if (ret != -1) { return ret }
			}
		break;
	}	
	//show_debug_message(ret)
	if (sprite_exists(ret)) {
		return ret
	} else {
		return -1 //if script still running, return nonexistant sprite
	}
} else { //sprite exists
	return ret //return the sprite
}