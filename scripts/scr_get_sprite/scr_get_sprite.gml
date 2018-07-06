///@func scr_get_sprite(object, string)
///@param object - the player object
///@param string - the string identifier of the sprite (everything after character 7)
///@desc returns the sprite id of a specific sprite given the character and animation type


var i, ret; //initialise variable

switch (argument[0].character) { //check charater
	case BAL: i = "spr_bal_" break;
	case GEO: i = "spr_geo_" break;
	case ETH: i = "spr_eth_" break;
	case MAC: i = "spr_mac_" break;
}

ret = asset_get_index(string(i + argument[1])) //get sprite

//check for special cases
if (ret = spr_mac_special_up) {
	ret = argument[0].sprite_index
	argument[0].image_speed = 0
	argument[0].hitbox_override = true
	with (instance_create((argument[0].bbox_left + argument[0].bbox_right)/2, 
	(argument[0].bbox_top + argument[0].bbox_bottom)/2, obj_mac_projectile)) {
		creator = argument[0]	
		type = 0
	}
}
if (ret = -1) { //if nonexistant sprite
	//check for special cases
	if (string_copy(argument[1], 1, 11) = "dash_attack") { //dash attack
		ret = asset_get_index(i + "dash_attack")	
	}
	if (string_copy(argument[1], 1, 3) = "jab") { //jab attack
		ret = asset_get_index(i + "jab_" + string(argument[0].jab))	
	}
	if (string_copy(argument[1], 1, 10) = "smash_back") { //smash forward and pivot
		ret = asset_get_index(i + "smash_forward")	
	}
	if (string_copy(argument[1], 1, 9) = "tilt_back") { //tilt forward and pivot
		ret = asset_get_index(i + "tilt_forward")	
	}
	if (string_copy(argument[1], 1, 8) = "grab_jab") { //grab jab
		ret = asset_get_index(i + "grab_jab")	
	}
	if (string_copy(argument[1], 1, 4) = "grab") {
		if (asset_get_index(i + "grab") > -1) { //if a directionless grab exists
			ret = asset_get_index(i + "grab")
		}
	}
	switch (argument[0].character) { //check for character specific special cases
		case ETH:
			if (string_copy(argument[1], 1, 4) = "tilt") { //smash attack
				ret = asset_get_index(i + string_replace(argument[1], "tilt", "smash"))
			}
			if (string_copy(argument[1], 1, 4) = "dash") {
				ret = asset_get_index(i + "run")
			}
			if (string_copy(argument[1], 1, 5) = "speed") {
				ret = asset_get_index(i + "walk")
			}
		break;
		case GEO:
			if (string_copy(argument[1], 1, 4) = "dash") {
				ret = asset_get_index(i + "run")
			}
			if (string_copy(argument[1], 1, 5) = "speed") {
				ret = asset_get_index(i + "walk")
			}
			if (string_copy(argument[1], 1, 12) = "special_down") {
				ret = asset_get_index(i + "special_down_start")
			}
			if (string_copy(argument[1], 1, 3) = "jab") {
				ret = asset_get_index(i + "flurry")	
			}
		break;
	}	
	if (sprite_exists(ret)) {
		return ret
	} else {
		return -1 //if script still running, return nonexistant sprite
	}
} else { //sprite exists
	if (ret = spr_eth_smash_up) {
		with (obj_eth_platform) {
			if (scr_point_in_rec(argument[0].x, argument[0].y + 5, hitbox)) {
				return -1	
			}
		}
	}
	return ret //return the sprite
}