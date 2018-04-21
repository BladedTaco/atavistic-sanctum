/// @description send data to clients

var count = global.player_number //get amount of sockets on network as a local variable

if (count > 0) { //if there are sockets to send data to
	var buff = player_buffer //create a local accessor for the player_buffer
	buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
	buffer_write(buff, buffer_u32, count) //write the number of players to the buffer
	for (var i = 0; i < count; i++) { //for each socket
		buffer_write(buff, buffer_s16, i) //write player number
		buffer_write(buff, buffer_string, data_array[i, 0]) //write player name	
		//...
		//...
		//...
	}
	for (var i = 0; i < count; i++) { //for each socket
		network_send_packet(socket_array[i], player_buffer, buffer_tell(player_buffer)); //send the data
	}	
}