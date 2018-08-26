///@func scr_end_game(end_condition, *forfeiter)
///@param end_condition - the reason the game ended. (stocks, time, forfeit)  (0 1 2)
///@param *forfeiter - on a forfeit, the player who forfeited


if (!instance_exists(obj_replay_handler)) { //if not in a replay
	with (obj_match_handler) {
		scr_record_replay() //record the last frames inputs
	}
}

with (obj_player) {
	switch (argument[0]) {
		case 0: //stocks ran out
			if (stocks > 0) {
				obj_results.placing[array_length_1d(obj_results.placing)] = player_number
				placing = array_length_1d(obj_results.placing) - 1
			}
		break;
		case 1: //time ran out
			if (stocks > 0) { // was a stock match
				placing = stocks*100 - percentage/100
			}
			if (stocks = -1) { //was a timed match
				placing = array_length_2d(obj_results.kills, player_number) - array_length_2d(obj_results.deaths, player_number)
			}
		break;
		case 2: //forfeit
			if (player_number = argument[1]) {
				placing = 0
			} else {
				placing = 1
			}
		break;
	}
	
	obj_results.real_placing[player_number, 0] = player_number
	obj_results.real_placing[player_number, 1] = placing
	obj_results.pal_surface[player_number] = pal_surface
	obj_results.character[player_number] = character
	obj_results.name[player_number] = name
	obj_results.img_blend[player_number] = img_blend
	obj_results.player_col[player_number] = player_col
	instance_destroy();
}

with (obj_results) {
	real_placing = array_sort_2d(real_placing, 1, 1) //sort the placing array descending by placing value
	real_placing[0, 2] = 1 //set first place
	for (var i = 1; i < array_height_2d(real_placing); i++) { //loop through to set the rest of the placings
		if (real_placing[i, 1] = real_placing[i-1, 1]) { //if placed the same as the previous placing
			real_placing[i, 2] = real_placing[i-1, 2] //share placing
		} else { 
			real_placing[i, 2] = i + 1 //otherwise placing is position as non 0-based number
		}
	}
	real_placing = array_sort_2d(real_placing, 0, 0) //sort the placing array ascending by player number
	num = global.player_number //set number of player
	//set kill and death count
	for (var i = 0; i < num; i++) {
		for (var o = 0; o < array_length_2d(kills, i); o++) {
			if (kills[i, o] >= 0) {
				kill_count[i, kills[i, o]] += 1
			}
		}
		for (var o = 0; o < array_length_2d(deaths, i); o++) {
			if (deaths[i, o] >= 0) {
				death_count[i, deaths[i, o]] += 1
			}
		}
	}
	if (!instance_exists(obj_replay_handler)) { //if not in a replay
		//create the replay saving object
		buffer_save(obj_match_handler.replay_buffer, "OUTPUT.txt")
		with (instance_create(x, y, obj_save_replay)) {	
			replay_buffer = buffer_compress(obj_match_handler.replay_buffer, 0, buffer_tell(obj_match_handler.replay_buffer))
			header_string = obj_match_handler.header_string
		}
		buffer_delete(obj_match_handler.replay_buffer) //delete the buffer from memory
	} else { //end of a replay
		obj_replay_handler.active = false //make sure replay handler is inactive
		scr_reset_players()
	}
	//set the position and visibility of the results screen
	x = 0
	y = GUI_HEIGHT
	visible = true
}
instance_destroy(obj_match_handler) //destroy the match handler