/// @description Initialise the client
player_name = global.player_name
buff = buffer_create(256, buffer_grow, 1); //create a buffer for networking
client = network_create_socket(global.network_protocol) //create socket
global.client = client //used to ignore messages sent to self if this client is also a server
player_number = 0
input_buffer_array[0,0] = 0
input_array[0, 0] = 0

if (network_connect(client, global.network_ip, 6510) != 0) { //try to connect to server
	//could not connect to network
	show_message("Failed to connect to server.") //display message
	instance_destroy(); //destroy self
	exit; //exit code execution
}

//send 
buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
buffer_write(buff, buffer_s16, PING_CMD); //write the data identifer to the buffer
//buffer_write(buff, buffer_string, player_name); //write the player name into the buffer
//...
//...
//...

network_send_packet(client, buff, buffer_tell(buff)); //send the buffer to the server

alarm[0] = room_speed*2 //create an alarm for sending 'keep alive' pings