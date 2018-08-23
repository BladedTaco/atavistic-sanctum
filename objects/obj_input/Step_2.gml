/// @description 
if (paused = -2) {
	with (obj_match_handler) {
		event_perform(3, 0)
	}
	with (obj_player) {
		event_perform(3, 0)	
	}
	paused = -1
}
if (instance_exists(obj_replay_handler) and obj_replay_handler.active) {
	if (global.match_frame > 2) { //if not the first 3 frames
		for (var i = 0; i < global.player_number; i++) { //for each player
			old_axis[i, 0] = input_array[i, 0] //store old xaxis
			old_axis[i, 1] = input_array[i, 1] //store old yaxis
		}
	}
}
show_debug_message(object_get_name(event_object) + " " + string(event_type) + "-" + string(event_number))