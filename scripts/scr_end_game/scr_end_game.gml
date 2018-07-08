///@func scr_end_game(end_condition)
///@param end_condition - the reason the game ended. (stocks, time, forfeit)  (0 1 2)


with (obj_player) {
	switch (argument[0]) {
		case 0: //stocks ran out
			if (stocks > 0) {
				obj_results.placing[array_length_1d(obj_results.placing)] = player_number
				placing = array_length_1d(obj_results.placing) - 1
			}
		break;
		case 1: //time ran out
			if (stocks > 0) {
				placing = -1
			}
		break;
		case 2: //forfeit
			placing = -1
		break;
	}
	
	obj_results.real_placing = placing
	obj_results.pal_surface[player_number] = pal_surface
	obj_results.character[player_number] = character
	obj_results.name[player_number] = name
	obj_results.img_blend[player_number] = img_blend
	obj_results.player_col[player_number] = player_col
	instance_destroy();
}

with (obj_results) {
	if (argument[0] = 1) {
		var i = array_length_1d(placing)
		for (var o = 0; o < global.player_number; o++) {
			if (real_placing[o] = -1) {
				for (var j = o; j < global.player_number; j++) {
					
				}
			}
		}
	}
}
instance_destroy(obj_match_handler)