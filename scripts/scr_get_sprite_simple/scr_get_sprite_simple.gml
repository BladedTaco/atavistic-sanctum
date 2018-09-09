///@func scr_get_sprite(number, string)
///@param number - the number of the character macro
///@param string - the string identifier of the sprite (everything after character 7)
///@desc returns a sprite based on character and string without any error checking


var i = ""//initialise variable

if (argument[1] = "pal") {
	switch (argument[0]) { //check charater
		case BAL: i = "pal_bal" break;
		case GEO: i = "pal_geo" break;
		case ETH: i = "pal_eth" break;
		case MAC: i = "pal_mac" break;
	}
	return asset_get_index(i) //get sprite //return the sprite, whether it exists or not
} else {
	switch (argument[0]) { //check charater
		case BAL: i = "spr_bal_" break;
		case GEO: i = "spr_geo_" break;
		case ETH: i = "spr_eth_" break;
		case MAC: i = "spr_mac_" break;
	}
}

return asset_get_index(string(i + argument[1])) //get sprite //return the sprite, whether it exists or not
