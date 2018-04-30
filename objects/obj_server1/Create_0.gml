/// @description Initialise Server
//set global variables to base states
global.player_number = 0

macros()

server_name = "SERVER" //set base server name

//create buffers and arrays for later use
broadcast_buffer = buffer_create(32, buffer_fixed, 1); //buffer to broadcast server
player_buffer = buffer_create(16384, buffer_fixed, 1); //buffer to send data with
socket_array[0] = -1 //array to hold socket ids
data_array[0, 0] = -1 //array for holding player data to be sent
input_buffer_array[0, 0] = -1 //array for holding inputs to be distributed

server = network_create_server(global.network_protocol, 6510, global.max_players) //create the server
if (server < 0) { //if there is already a server running
	//clear buffers from RAM, destroy instance
	buffer_delete(broadcast_buffer)
	buffer_delete(player_buffer)
	instance_destroy();
}

alarm[0] = room_speed //create an alarm for sending a broadcast signal
alarm[1] = room_speed











/*

data_array[i, 0] = 0 //player name
data_array[i, 1] = 0 //player profile name
data_array[i, 2] = 0 //character
data_array[i, 3] = 0 //custom color string
data_array[i, 4] = 0 //ready status
data_array[i, 5] = 0 //matchmaking rank
data_array[i, 6] = 0 //player slot number
data_array[i, 7] = 0 //team color
data_array[i, 8] = 0 //server
data_array[i, 9] = 0 //ping