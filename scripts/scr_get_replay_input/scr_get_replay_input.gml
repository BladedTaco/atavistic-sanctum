///@func scr_get_replay_input()
///@desc handles the inputs for a replay

with (obj_input) {
	if (global.match_frame > 2) { //if not the first 3 frames
		for (var i = 0; i < global.player_number; i++) { //for each player
			old_axis[i, 0] = input_array[i, 0] //store old xaxis
			old_axis[i, 1] = input_array[i, 1] //store old yaxis
		}
	}
	input_array = obj_replay_handler.input_array //get the new input array
	if (global.match_frame > 1) { //if not the first two frames
		for (var i = 0; i < global.player_number; i++) { //for each player
			//check for termination of sticky controls
			if (sticky_jump[i] and !input_array[i, JUMP]) {
				sticky_jump[i] = false
			}
			if (sticky_attack[i] and !input_array[i, ATTACK]) {
				sticky_attack[i] = false
			}
			if (sticky_special[i] and !input_array[i, SPECIAL]) {
				sticky_special[i] = false
			}
			if (sticky_dodge[i] and ((!input_array[i, SHIELD]) or
				(point_distance(0, 0, input_array[i, XAXIS], input_array[i, YAXIS])
				< l_stick_neutral[i]))) {
				sticky_dodge[i] = false
			}
		}
		for (var i = 0; i < array_height_2d(button_array); i++) {
			scr_get_input(i, controller[i], controller_number[i])
		}
	}
}