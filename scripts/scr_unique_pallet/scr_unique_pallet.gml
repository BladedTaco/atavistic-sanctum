///@func scr_unique_pallet(player_number, character, pallet)
///@param player_number - the player number checking for a unique pallet
///@param character - the character to check
///@param pallet - the pallet to check for
///@desc returns whether or not the given pallet is unique

for (var i = 0; i < player_number; i++) {
	if (i != argument[0]) {
		if (character[i] = argument[1]) {
			if (pallet[i] = argument[2]) {
				return false	
			}
		}
	}
}
return true