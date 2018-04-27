/// @description 

macros();

player_number = 0 //number of the player (maps to input_array's first dimension
controller = false //if this player is using a controller
controller_number = 4 //the slot number of the controller the player is using
player_is_local = true; //if player is locally controlled
c_stick_action = C_SMASH_ATTACK //action the c_stick maps to
c_stick_deadzone = 0.25 //the deadzone for the c_stick
l_stick_deadzone = 0.25 //the deadzone for the left stick

for (var i = 0; i <= 7; i++) { //player number
	for (var o = 10; o <= 15; o++) { //field number
		input_array[i, o] = 0 //player inputs
	}
	for (var j = 0; j <= global.input_buffer_length; j++) { //for each player
		for (var k = 0; k < 1000; k++) { //for each input
			input_buffer_array[j*100 + i, k] = 0 //initialise an array position
		}
	}
}

if (controller) {
	scr_initialise_controller_inputs(player_number)
} else {
	scr_initialise_keyboard_inputs(player_number)
}


/*


input_array[i, 0] = 0 // xaxis
input_array[i, 1] = 0 // yaxis
input_array[i, 2] = 0 // attack_key
input_array[i, 3] = 0 // special_key
input_array[i, 4] = 0 // jump_key
input_array[i, 5] = 0 // pause_key
input_array[i, 6] = 0 // shield_key
input_array[i, 7] = 0 // grab_key
input_array[i, 8] = 0 // taunt_key
input_array[i, 9] = 0 // n/a, tilt, smash (end of networking array sent)
input_array[i, 10] = 0 // xaxis
input_array[i, 11] = 0 // yaxis
input_array[i, 12] = 0 // left stick press
input_array[i, 13] = 0 // right stick press