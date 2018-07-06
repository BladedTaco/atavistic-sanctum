///@func scr_perform_ledge(object, player_number, action)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the ledge action with
///@param action - the type of action to perform (attach, attack, roll, grab, jump, release) (0 1 2 3 4 5 respectively)
///@desc causes the given character to perform a ledge action and returns state

if (argument[2] != 0) {
	var _ledge = instance_nearest(argument[0].x, argument[0].y, obj_ledge)
	argument[0].x = _ledge.x
	argument[0].y = _ledge.y	
}

switch (argument[2]) { //check action type
	case 0: //attach to ledge
		if ((argument[0].alarm[0] < 0) or (state[argument[1]] = LEDGE)) {
			if (input_array[argument[1], YAXIS] < obj_input.l_stick_deadzone[argument[1]]) {
				argument[0].sprite_index = scr_get_sprite(argument[0], "ledge") //set character to ledge animation
				var _ledge = instance_nearest(argument[0].x, argument[0].y, obj_ledge)
				switch (state[argument[1]]) {
					case LEDGE:
						argument[0].x = lerp(_ledge.x, argument[0].x, 0.75)
						argument[0].y = lerp(_ledge.y, argument[0].y, 0.75)
					break;
					case AIRBORNE: case JUMP_RISE: case FREEFALL: //if able to grab ledge
						argument[0].x = lerp(_ledge.x, argument[0].x, 0.75)
						argument[0].y = lerp(_ledge.y, argument[0].y, 0.75)
						argument[0].image_xscale = _ledge.facing
						argument[0].image_index = 0 //set character to first frame of animation
						argument[0].alarm[0] = GAME_SPEED*3 //set ledge alarm for hold duration
						_ledge.free = false
						return LEDGE //return ledge hold state
					break; 
						
					default:
							return state[argument[1]]
					break;
				}
			}
		}
		return state[argument[1]] //return current state if unable to grab ledge
	break;
	
	case 1: //ledge attack
		argument[0].sprite_index = scr_get_sprite(argument[0], "ledge_attack") //set character to ledge attack animation
		argument[0].image_index = 0 //set character to first frame of animation
	break;
	
	case 2: //ledge roll
		argument[0].sprite_index = scr_get_sprite(argument[0], "ledge_roll") //set character to ledge roll animation
		argument[0].image_index = 0 //set character to first frame of animation
	break;
	
	case 3: //ledge grab
		argument[0].sprite_index = scr_get_sprite(argument[0], "ledge_grab") //set character to ledge grab animation
		argument[0].image_index = 0 //set character to first frame of animation
	break;
	
	case 4: //ledge jump
		argument[0].sprite_index = scr_get_sprite(argument[0], "ledge_jump") //set character to ledge jump animation
		argument[0].image_index = 0 //set character to first frame of animation
		argument[0].alarm[0] = GAME_SPEED*2 //set ledge alarm for time until regrab
	break;
	
	case 5: //ledge release
		argument[0].sprite_index = scr_get_sprite(argument[0], "air_move") //set character to air move animation
		argument[0].image_index = 0 //set character to first frame of animation
		argument[0].alarm[0] = GAME_SPEED*2 //set ledge alarm for time until regrab
		return AIRBORNE //return airborne state
	break;
}
return LEDGE_ALT //return state as ledge alt if code execution reaches here