///@func scr_perform_jump_squat(object, player_number)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the jump squat with
///@desc causes the given character to perform a jump squat and returns state

if ((argument[0].momentum_y >= 0) and (!obj_input.sticky_jump[argument[1]])) { //if able to jump
	argument[0].sprite_index = scr_get_sprite(argument[0], "jump") //set animation to jump animation
	argument[0].image_index = 0 //set animation frame to the first one
	obj_input.sticky_jump[argument[1]] = true //set sticky jump to true
	return JUMPING //return the jumping state
} else { return state[argument[1]] } //else return current state