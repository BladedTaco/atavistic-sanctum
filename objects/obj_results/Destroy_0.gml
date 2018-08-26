/// @description 
//free surfaces
for (var i = 0; i < array_length_1d(pal_surface); i++) {
	surface_free(pal_surface[i])
}

//possbily free up buffers from obj save replay
if (instance_exists(obj_save_replay)) {
	if (obj_save_replay.visible = false) {
		//free up buffer and destroy object
		buffer_delete(obj_save_replay.replay_buffer)
		instance_destroy(obj_save_replay)
	}
}

//reset players and clear inputs
scr_reset_players()