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
	c_stick_action[i] = C_TILT_ATTACK //action the c_stick maps to
	c_stick_deadzone[i] = 0.15 //the deadzone for the c_stick
	l_stick_deadzone[i] = 0.15 //the deadzone for the left stick
	l_stick_neutral[i] = 0.5 //the point where a input is considered not neutral
	axis[i, 0] = 1 //l horizontal multiplier
	axis[i, 1] = 1 //l vertical multiplier
	axis[i, 2] = 1 //r horizontal multiplier
	axis[i, 3] = 1 //r vertical multiplier
	axis[i, 4] = 1 //l trigger multiplier
	axis[i, 5] = 1 //r trigger multiplier
	controls_set[i] = 0 //stage of control configuration
	button[i, 0] = 0 //initial controller configuartion
	smash[i] = 0.3 //difference needed for a smash
	analogue[i] = 0 //0 if analogue triggers, 2 if digital triggers

	controller[i] = true //if this player is using a controller
	controller_number[i] = -1 //the slot number of the controller the player is using
	player_is_local[i] = true; //if player is locally controlled
	sticky_jump[i] = false //make it only jump multiple times on multiple presses
	sticky_dodge[i] = false //make it only dodge multiple times on multiple presses
	sticky_attack[i] = false //make it only attack multiple times on multiple presses
	sticky_special[i] = false //make it only use special multiple times on multiple presses
	sticky_pause[i] = false //make it only pause and unpause on unique presses
	smash_deadzone[i] = 0.25 //the deadzone where smash attacks cannot happen inside
}
paused = -1 //which player has paused the game
pause_sprite = -1 //the sprite used on the pause screen
menu_index = 0;
menu_direction = 0;
menu_option[0] = "RESUME"
menu_option[1] = "hitboxes: hidden"
menu_option[2] = "Input lag: 5 frame"
menu_option[3] = "Game speed: 1x"
menu_option[4] = "UI: SHOWN"
menu_option[5] = "FORFEIT"

replay = false;
pause = noone //the pause object (in match only)
forfeiter = -1 // the forfeiter for a forfeit
//initialise input buttons and their mappings

scr_initialise_controller_inputs()
//scr_initialise_keyboard_inputs(0)

alarm[0] = room_speed //alarm for keeping OS from sleeping
alarm[1] = -1 //alarm for pause menu
