/// @description 


player_number = 0
controller = false
controller_number = 4

for (var i = 0; i <= 7; i++) { //player number
	for (var o = 0; o <= 9; o++) { //field number
		data_array[i, o] = "" //player data
		input_array[i, o] = 0 //player inputs
	}
	for (var o = 10; o <= 15; o++) { //field number
		input_array[i, o] = 0 //player inputs
	}
}

if (controller) {
	scr_initialise_controller_inputs(player_number)
} else {
	scr_initialise_keyboard_inputs(player_number)
}


/*

data_array[i, 0] = 0 //player name
data_array[i, 1] = 0 //player profile name
data_array[i, 2] = 0 //character
data_array[i, 3] = 0 //custom color string
data_array[i, 4] = 0 //ready status
data_array[i, 5] = 0 //matchmaking rank
data_array[i, 6] = 0 //player slot number
data_array[i, 7] = 0 //team color
data_array[i, 8] = 0 //server
data_array[i, 9] = 0 //ping

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



//gp_face1			Top button 1 
//gp_face2			Top button 2 
//gp_face3			Top button 3 
//gp_face4			Top button 4 
//gp_shoulderl		Left shoulder button
//gp_shoulderr		Right shoulder button
//gp_select			The select button 
//gp_start			The start button 
//gp_stickl			The left stick pressed (as a button)
//gp_stickr			The right stick pressed (as a button)
//gp_padu			D-pad up
//gp_padd			D-pad down
//gp_padl			D-pad left
//gp_padr			D-pad right
//gp_shoulderrb		Right shoulder trigger
//gp_shoulderlb		Left shoulder trigger
//gp_axislh			Left stick horizontal axis (analogue)
//gp_axislv			Left stick vertical axis (analogue)
//gp_axisrh			Right stick horizontal axis (analogue)
//gp_axisrv			Right stick vertical axis (analogue)