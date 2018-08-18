/// @description 
if (async_load[? "id"] = saveid) { //if replay buffer called event
	if (async_load[? "status"]) { //if successfully saved
		//append filename and header data to replays index
		var _file = file_text_open_append("replays.txt")
		file_text_write_string(_file, string_replace(replay_file_string, ".txt", "\n") + header_string)
		file_text_close(_file)
	} else { //save failed
		if (show_question("Save unsuccessful,\nTry again?")) { //ask for retry
			//try saving again
			buffer_async_group_begin("replays")
			buffer_save_async(replay_buffer, replay_file_string, 0, buffer_get_size(replay_buffer))
			saveid = buffer_async_group_end()
			exit //stop buffer from being deleted and this instance destroyed
		}
	}
}

buffer_delete(replay_buffer) //delete the buffer now that is saved
instance_destroy(); //destroy this object