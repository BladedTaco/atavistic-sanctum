/// @description 
if (visible and !save_replay) { //if made visible, only once
	//save buffer
	buffer_async_group_begin("replays")
	buffer_save_async(replay_buffer, replay_file_string, 0, buffer_get_size(replay_buffer))
	saveid = buffer_async_group_end()
	save_replay = true
}
