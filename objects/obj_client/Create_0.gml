/// @description Initialise the client
player_name = global.player_name
buff = buffer_create(256, buffer_grow, 1); //create a buffer for networking
client = network_create_socket(global.network_protocol) //create socket
global.client = client //used to ignore messages sent to self if this client is also a server
player_number = 0
alarm[1] = GAME_SPEED*2

if (global.network_protocol = network_socket_tcp) { //if using tcp
	if (network_connect(client, global.network_ip, 6510) != 0) { //try to connect to server
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





for (var i = 0; i < 200; i++) {

	sprite_set_speed(spr_bal_default + i, sprite_get_speed(spr_bal_default + i)/60, spritespeed_framespergameframe)
}