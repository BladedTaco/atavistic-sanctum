/// @description send a 'keep alive' ping to the server

buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
buffer_write(buff, buffer_s16, PING_CMD); //write the ping identifer into the buffer

network_send_udp(client, global.network_ip, 6510, buff, buffer_tell(buff))

/*

if (network_send_packet(client, buff, buffer_tell(buff)) <= 0) { //send packet and see if it fails
	//if failed to send
	network_destroy(client) //destroy the socket
	buffer_delete(buff) //delete the buffer
	show_message("Failed to send packet.") //display message
	instance_destroy(); //destroy self
	exit; //exit code execution
}


alarm[0] = room_speed * 2 //set alarm to 2 seconds