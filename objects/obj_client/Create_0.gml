/// @description Initialise the client
player_name = global.player_name
buff = buffer_create(1024, buffer_grow, 1); //create a buffer for networking
client = network_create_socket(global.network_protocol) //create socket
global.client = client //used to ignore messages sent to self if this client is also a server
player_number = 0
alarm[1] = GAME_SPEED*2
added_players = false //for char menu

if (global.network_protocol = network_socket_tcp) { //if using tcp
	if (network_connect(client, global.network_ip, global.network_port) < 0) { //try to connect to server
		//could not connect to network
		show_message("Failed to connect to server.") //display message
		instance_destroy(); //destroy self
		exit; //exit code execution
	}
}

//send 
buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
buffer_write(buff, buffer_s16, PING_CMD); //write the data identifer to the buffer
//buffer_write(buff, buffer_string, player_name); //write the player name into the buffer
//...
//...
//...

network_send(client, buff); //send the buffer to the server

alarm[0] = GAME_SPEED*2 //create an alarm for sending 'keep alive' pings


for (var i = 0; i < 8; i++) {
	data_array[i, 0] = 0 //player name				n/a
	data_array[i, 1] = 0 //player profile name		*
	data_array[i, 2] = 0 //character				*
	data_array[i, 3] = 0 //custom color string		n/a
	data_array[i, 4] = 0 //ready status				n/a
	data_array[i, 5] = 0 //matchmaking rank			n/a
	data_array[i, 6] = 0 //player slot number		*
	data_array[i, 7] = 0 //team color				n/a
	data_array[i, 8] = 0 //server					?
	data_array[i, 9] = 0 //ping						n/a
}