/// @description 
for (var i = 0; i < array_length_1d(pal_surface); i++) {
	surface_free(pal_surface[i])
}

//either write the replay string to the replay file, or delete it
if (save_replay) {
	replay_file = file_text_open_append(replay_file_string)
	var _len = array_length_1d(replay_string)
	for (var i = 0; i < _len; i++) {
		file_text_write_string(replay_file, replay_string[i])
	}
	file_text_close(replay_file)
	show_debug_message(replay_file_string)
} else {
	if (file_exists(replay_file_string)) {
		file_delete(replay_file_string)	
	}
}
