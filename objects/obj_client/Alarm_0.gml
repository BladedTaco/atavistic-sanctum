/// @description send a 'keep alive' ping to the server

buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
buffer_write(buff, buffer_s16, PING_CMD); //write the ping identifer into the buffer

if ((network_send(client, buff) < 0) and (global.network_protocol = network_socket_tcp)) { //send packet and see if it fails
	//if failed to send
	network_destroy(client) //destroy the socket
	buffer_delete(buff) //delete the buffer
	show_message_async("Failed to send packet. Exiting Online mode...") //display message
	scr_reset_networking(true)
}


alarm[0] = GAME_SPEED * 2 //set alarm to 2 seconds