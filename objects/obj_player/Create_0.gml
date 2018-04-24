/// @description 

for (var i = 0; i <= 7; i++) { //player number
	for (var o = 0; o <= 9; o++) { //field number
		data_array[i, o] = "" //player data
		input_array[i, o] = 0 //player inputs
	}
	for (var o = 10; o <= 15; o++) { //field number
		input_array[i, o] = 0 //player inputs
	}
	
	/*
	//keyboard
	button_array[i, 0]  = 0		//gp_face1		A					.Q
	button_array[i, 1]  = 0		//gp_face2		B					.W
	button_array[i, 2]  = 1		//gp_face3		X					.E
	button_array[i, 3]  = 1		//gp_face4		Y					.R
	button_array[i, 4]  = 2		//gp_shoulderl	-					.T
	button_array[i, 5]  = 2		//gp_shoulderr	Z					.Y
	button_array[i, 6]  = 3		//gp_select		-					.U
	button_array[i, 7]  = 3		//gp_start		START				.I
	button_array[i, 8]  = 4		//gp_stickl		-					.O
	button_array[i, 9]  = 5	    //gp_stickr		-					.P
	button_array[i, 10] = 6	    //gp_padu		D-Pad UP			.A
	button_array[i, 11] = 7		//gp_padd		D-Pad DOWN			.S
	button_array[i, 12] = 8		//gp_padl		D-Pad LEFT			.D
	button_array[i, 13] = 9		//gp_padr		D-Pad RIGHT			.F
	button_array[i, 14] = 10		//gp_shoulderrb	RIGHT TRIGGER		.G
	button_array[i, 15] = 11		//gp_shoulderlb	LEFT TRIGGER		.H
	button_array[i, 16] = 12		//gp_axislh		L STICK Hori		.J
	button_array[i, 17] = 13		//gp_axislv		L STICK Vert		.K
	button_array[i, 18] = 14		//gp_axisrh		C STICK Hori		.L
	button_array[i, 19] = 15	//gp_axisrv		C STICK Vert		.Z
	
//keyboard
	button_const_array[i, 0]  = ord("Q")
	button_const_array[i, 1]  = ord("W")
	button_const_array[i, 2]  = ord("E")
	button_const_array[i, 3]  = ord("R")
	button_const_array[i, 4]  = ord("T")
	button_const_array[i, 5]  = ord("Y")
	button_const_array[i, 6]  = ord("U")
	button_const_array[i, 7]  = ord("I")
	button_const_array[i, 8]  = ord("O")
	button_const_array[i, 9]  = ord("P")
	button_const_array[i, 10] = ord("A")
	button_const_array[i, 11] = ord("S")
	button_const_array[i, 12] = ord("D")
	button_const_array[i, 13] = ord("F")
	button_const_array[i, 14] = ord("G")
	button_const_array[i, 15] = ord("H")
	button_const_array[i, 16] = ord("J")
	button_const_array[i, 17] = ord("K")
	button_const_array[i, 18] = ord("L")
	button_const_array[i, 19] = ord("Z")
	
	*/
}

scr_initialise_controller_inputs()






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