///@func scr_perform_ledge(object, player_number, action)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the ledge action with
///@param action - the type of action to perform (attach, attack, roll, grab, jump, release) (0 1 2 3 4 5 respectively)
///@desc causes the given character to perform a ledge action and returns state

argument[0].image_index = 0 //set character to first frame of animation
argument[0].alarm[0] = GAME_SPEED*2 //set the ledge alarm to 2 seconds
switch (argument[2]) { //check action type
	case 0: //attach to ledge
		argument[0].sprite_index = scr_get_sprite(argument[0], "ledge") //set character to ledge animation
		return LEDGE //return ledge hold state
	break;
	
	case 1: //ledge attack
		argument[0].sprite_index = scr_get_sprite(argument[0], "ledge_attack") //set character to ledge attack animation
	break;
	
	case 2: //ledge roll
		argument[0].sprite_index = scr_get_sprite(argument[0], "ledge_roll") //set character to ledge roll animation
	break;
	
	case 3: //ledge grab
		argument[0].sprite_index = scr_get_sprite(argument[0], "ledge_grab") //set character to ledge grab animation
	break;
	
	case 4: //ledge jump
		argument[0].sprite_index = scr_get_sprite(argument[0], "ledge_jump") //set character to ledge jump animation
	break;
	
	case 5: //ledge release
		argument[0].sprite_index = scr_get_sprite(argument[0], "air_move") //set character to air move animation
		return AIRBORNE //return airborne state
	break;
}
return LEDGE_ALT //return state as ledge alt if code execution reaches here