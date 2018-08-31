///@func scr_training_cpu(cpu_action, cpu_index)
///@param cpu_action - the action for the training cpus to take
///@param cpu_index - the counter that handles the specific action for the cpus
///@desc controls the training mode cpus
var _end = false //whether or not to reset cpu_index
var _inst = noone
var _index = argument[1]
var _player = obj_match_handler.player[0]
for (var i = 1; i < global.player_number; i++) {
	_end = false
	old_axis[i, 0] = input_array[i, 0] //store old xaxis
	old_axis[i, 1] = input_array[i, 1] //store old yaxis
	_inst = obj_match_handler.player[i]
	switch (argument[0]) {
		case "IDLE": break; //do nothing
		case "MOVE": //move back and forth
			if (_index[i-1] < GAME_SPEED) {
				input_array[i, XAXIS] = 1
			} else if (_index[i-1] < GAME_SPEED*2) {
				input_array[i, XAXIS] = -1
			} else {
				_end = true
			}
		break;
		case "FOLLOW": //follow the player
			if (abs(_inst.x - _player.x) > 20) { //if far from player horizontally
				input_array[i, XAXIS] = sign(_player.x - _inst.x) //move towards player
			} else {
				input_array[i, XAXIS] = 0
			}
			if (_inst.y - _player.y > 15) { //if well below player
				if !(sticky_jump[i]) { //if a new jump press
					_end = true //reset index
					input_array[i, JUMP] = 1 //jump
				} else if (_index[i-1] < GAME_SPEED*0.65) { //jump for 0.65 seconds
					input_array[i, JUMP] = 1 //jump	
				} else if (_index[i-1] >= GAME_SPEED*0.75) { //release for 0.1 seconds
					_end = true //reset index
				} else {
					input_array[i, JUMP] = 0 //dont jump	
				}
			} else if (_player.y - _inst.y > 30) { //if well above player
				input_array[i, YAXIS] = 1
			} else {
				input_array[i, YAXIS] = 0	
			}
		break;
		case "MIMIC": //copy the players inputs
			for (var o = 0; o <= TILT; o++) {
				input_array[i, o] = input_array[0, o]	
			}
		break;
		case "JUMP": //jump in place
			if !(sticky_jump[i]) { //if a new jump press
				_end = true //reset index
				input_array[i, JUMP] = 1 //jump
			} else if (_index[i-1] < GAME_SPEED*0.65) { //jump for 0.65 seconds
				input_array[i, JUMP] = 1 //jump	
			} else if (_index[i-1] >= GAME_SPEED*0.75) { //release for 0.1 seconds
				_end = true //reset index
			} else {
				input_array[i, JUMP] = 0 //dont jump	
			}
		break;
	}
	//check for termination of sticky jump
	if (sticky_jump[i] and !input_array[i, JUMP]) {
		sticky_jump[i] = false
	}
	if (sticky_attack[i] and !input_array[i, ATTACK]) {
		sticky_attack[i] = false
	}
	if (sticky_special[i] and !input_array[i, SPECIAL]) {
		sticky_special[i] = false
	}

	//check for termination of sticky dodge
	if (sticky_dodge[i] and ((!input_array[i, SHIELD]) or
		(point_distance(0, 0, input_array[i, XAXIS], input_array[i, YAXIS])
		< l_stick_neutral[i]))) {
		sticky_dodge[i] = false
	}
	
	if (_end) {
		obj_menu_training.cpu_index[i-1] = 0	
	} else {
		obj_menu_training.cpu_index[i-1] += 1	
	}
}


