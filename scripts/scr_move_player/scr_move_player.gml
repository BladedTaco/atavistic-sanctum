///@func scr_move_player(from, to)
///@param from - the player slot to move the player from
///@param to - the player slot to move the player to
///@desc moves a player slot for the character select menu
with (obj_menu_char_select) {
	cursor_x[argument[1]]	= cursor_x[argument[0]] 
	cursor_y[argument[1]]	= cursor_y[argument[0]] 
	character[argument[1]]	= character[argument[0]]  
	pal_sprite[argument[1]]	= pal_sprite[argument[0]] 
	pallet[argument[1]]		= pallet[argument[0]]
	sprite[argument[1]]		= sprite[argument[0]]
	name[argument[1]]		= name[argument[0]]
	col[argument[1]]		= col[argument[0]]
	sub_menu[argument[1]]	= sub_menu[argument[0]]
}

with (obj_input) {
	old_axis[argument[1], 0]  				= old_axis[argument[0], 0]
	old_axis[argument[1], 1]   				= old_axis[argument[0], 1]
	for (var o = 0; o <= 20; o++) {													
		input_array[argument[1], o]  		= input_array[argument[0], o]
	}						
	var _max = array_height_2d(input_buffer_array)/100
	for (var j = 0; j <= _max; j++) { //for each player
		for (var k = 0; k < 20; k++) { //for each input							
			input_buffer_array[j*100 + argument[1], k] = input_buffer_array[j*100 + argument[0], k]
		}																		
	}																			
	c_stick_action[argument[1]]   			= c_stick_action[argument[0]]
	c_stick_deadzone[argument[1]]   		= c_stick_deadzone[argument[0]]
	l_stick_deadzone[argument[1]]    		= l_stick_deadzone[argument[0]] 
	l_stick_neutral[argument[1]]   			= l_stick_neutral[argument[0]]
	axis[argument[1], 0]  					= axis[argument[0], 0]
	axis[argument[1], 1]  					= axis[argument[0], 1]
	axis[argument[1], 2]  					= axis[argument[0], 2]
	axis[argument[1], 3]  					= axis[argument[0], 3]
	axis[argument[1], 4]  					= axis[argument[0], 4]
	axis[argument[1], 5]  					= axis[argument[0], 5]
	controls_set[argument[1]]   			= controls_set[argument[0]]
	smash[argument[1]]   					= smash[argument[0]]
	analogue[argument[1]]   				= analogue[argument[0]]
	controller[argument[1]]   				= controller[argument[0]]
	controller_number[argument[1]]   		= controller_number[argument[0]]
	player_is_local[argument[1]]    		= player_is_local[argument[0]]  
	sticky_jump[argument[1]]  				= sticky_jump[argument[0]] 
	sticky_dodge[argument[1]]   			= sticky_dodge[argument[0]] 
	sticky_attack[argument[1]]   			= sticky_attack[argument[0]] 
	sticky_special[argument[1]]  			= sticky_special[argument[0]]
	sticky_pause[argument[1]]   			= sticky_pause[argument[0]]  
	smash_deadzone[argument[1]]  			= smash_deadzone[argument[0]]							
	trigger_threshold[argument[1]]			= trigger_threshold[argument[0]]
	for (var o = 0; o < array_length_2d(button, argument[0]); o++) {
		button[argument[1], o]   			= button[argument[0], o]
	}
	for (var o = 0; o < 20; o++) {
		button_const_array[argument[1], o]	= button_const_array[argument[0], o]  
		button_array[argument[1], o]		= button_array[argument[0], o] 
	}
}