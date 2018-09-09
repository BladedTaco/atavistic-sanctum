/// @description delete buffers

if (buffer_exists(broadcast_buffer)) {
	buffer_delete(broadcast_buffer)
}
if (buffer_exists(player_buffer)) {
	buffer_delete(player_buffer)
}

network_destroy(server)