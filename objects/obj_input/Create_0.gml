/// @description initialise input handling


//initialise input arrays
for (var i = 0; i < 8; i++) { //player number
	old_axis[i, 0] = 0 //store old xaxis
	old_axis[i, 1] = 0 //store old yaxis
	for (var o = 0; o <= 20; o++) { //field number
		input_array[i, o] = 0 //player inputs
	}
	for (var j = 0; j <= global.input_buffer_length + 50; j++) { //for each player
		for (var k = 0; k < 20; k++) { //for each input
			input_buffer_array[j*100 + i, k] = 0 //initialise an array position
		}
	}
	c_stick_action[i] = C_SMASH_ATTACK //action the c_stick maps to
	c_stick_deadzone[i] = 0.1 //the deadzone for the c_stick
	l_stick_deadzone[i] = 0.1 //the deadzone for the left stick
	l_stick_neutral[i] = 0.5 //the point where a input is considered not neutral
	axis[i, 0] = 1 //l horizontal multiplier
	axis[i, 1] = 1 //l vertical multiplier
	axis[i, 2] = 1 //r horizontal multiplier
	axis[i, 3] = 1 //r vertical multiplier
	axis[i, 4] = 1 //l trigger multiplier
	axis[i, 5] = 1 //r trigger multiplier
	controls_set[i] = 0 //stage of control configuration
	button[i, 0] = 0 //initial controller configuartion
	smash[i] = 0.2 //difference needed for a dash
	analogue[i] = 0 //0 if analogue triggers, 2 if digital triggers

	controller[i] = true //if this player is using a controller
	controller_number[i] = -1 //the slot number of the controller the player is using
	player_is_local[i] = true; //if player is locally controlled
	sticky_jump[i] = false //make it only jump multiple times on multiple presses
	sticky_dodge[i] = false //make it only dodge multiple times on multiple presses
	smash_deadzone[i] = 0.3 //the deadzone where smash attacks cannot happen inside
}



//initialise input buttons and their mappings

scr_initialise_controller_inputs()
scr_initialise_keyboard_inputs(1)


alarm[0] = room_speed //alarm for keeping OS from sleeping