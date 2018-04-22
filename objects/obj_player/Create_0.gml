/// @description 

for (var i = 0; i <= 7; i++) { //player number
	for (var o = 0; o <= 9; o++) { //field number
		data_array[i, o] = "" //player data
		input_array[i, o] = 0 //player inputs
		button_array[i, o] = 0//player controls
	}
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
input_array[i, 9] = 0 // n/a, tilt, smash (old xaxis and old yaxis substitutes)

button_array[i, 0] = 0 // xaxis
button_array[i, 1] = 0 // yaxis
button_array[i, 2] = 0 // attack_key
button_array[i, 3] = 0 // special_key
button_array[i, 4] = 0 // jump_key
button_array[i, 5] = 0 // pause_key
button_array[i, 6] = 0 // shield_key
button_array[i, 7] = 0 // grab_key
button_array[i, 8] = 0 // taunt_key
button_array[i, 9] = 0 // n/a, tilt, smash (old xaxis and old yaxis substitutes)