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
}



//initialise input buttons and their mappings

scr_initialise_controller_inputs()
scr_initialise_keyboard_inputs(0)


c_stick_action[0] = C_SMASH_ATTACK //action the c_stick maps to
c_stick_deadzone[0] = 0.25 //the deadzone for the c_stick
l_stick_deadzone[0] = 0.25 //the deadzone for the left stick


controller[0] = false //if this player is using a controller
controller_number[0] = 4 //the slot number of the controller the player is using
player_is_local[0] = true; //if player is locally controlled
sticky_jump[0] = false //make it only jump multiple times on multiple presses
sticky_dodge[0] = false //make it only dodge multiple times on multiple presses