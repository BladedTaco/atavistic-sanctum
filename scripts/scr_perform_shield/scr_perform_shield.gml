///@func scr_perform_shield(object, player_number, airborne)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the shield with
///@param airborne - if the character is grounded or airborne (0 1 respectively)
///@desc causes the given character to perform a shield

switch (argument[2]) { //check ground state
	case 0: //grounded
		argument[0].image_index = 0
		argument[0].sprite_index = 0
		
	break;
	
	case 1: //airborne
	
	break;
	
}