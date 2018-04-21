/// @description  Initialise the client
clientx = 64;   // player start X and Y
clienty = 192;
PlayerName = global.ServerName;   // get the name that was selected (it's a server OR player name)

// Create a buffer for the network messages
buff = buffer_create(256, buffer_grow, 1);
// Create a TCP/IP socket
client = network_create_socket(global.ServerType);
// remember this socket ID so the server can ignore it (if we have a local server)
global.client = client;
// We're playing!!
global.NetworkState = NETWORK_PLAY;

// Create a list to hold ALL sprites sent from the server
allsprites = ds_list_create();
sprites = 0;

// Connect to our server
var err = network_connect(client, global.connectip, 6510);
if err != 0
{
// if we can't connect, show and error and restart... could be more graceful :)
show_message("Error - can not connect to server!!");
game_restart();
}

// Client has connected to the server, so send our "player name"
SendName(PlayerName);
alarm[0] = room_speed * 2;




//summary
//set start position and name
//create a buffer to be used for networking
//create a socket
//remember the socket id
//set network state to playing identifier
//create a list to hold sprites sent from server
//connect to the server
//if it cant connect,
//	show error message and restart game
//send player name
//set alarm