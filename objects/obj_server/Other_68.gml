/// @description receive data from clients
var event_id = async_load[? "id"]; //get event id
var count = global.player_number //get the number of players

if (server = event_id) { //client connecting or disconnecting
	var type = async_load[? "type"]; //disconnecting or connecting
	var sock = async_load[? "socket"]; //get the ID of the socket
	var ip = async_load[? "ip"]; //get the IP of the socket
	
	if (type = network_type_connect) { //if connecting
		socket_array[count] = sock //add the socket id entry to the socket array
	} else { //disconnecting
		var shift = false //used to move all array entries down one
		global.player_number -= 1; //decrease number of players by 1
		for (var i = 0; i <	count - 1; i++) { //for each socket except the last
			if (socket_array[i] = sock) { //if disconnecting client
				shift = true //set shift to true
			} 
			if (shift) { //if shift is true
				//shift all array entries down one place, this also overwrites the slot being shifted to
				socket_array[i] = socket_array[i+1]
			}
		}
	}
} else if (event_id != global.client) { //connected client sending data that isn't itself
	var buff = async_load[? "buffer"] //store incoming buffer data
	var cmd = buffer_read(buff, buffer_s16); //store type of incoming data
	var sock = async_load[? "id"]; //get the socket id of the client
	for (var i = 0; i < count; i++) { //for each socket
		if (socket_array[i] = sock) { //if the socket id mathces the one in the array
			sock = i //sock is set to the player number of the client
			break; //exit the for loop
		}
	}
	switch (cmd) {
		case INPUT_CMD: //read the input buffer sent by the client
			buffer_read(buff, buffer_s16)
			//...
			//...
			//...
		break;
		
		case DATA_CMD: //read the player data sent by the client
			buffer_read(buff, buffer_s16)
			//...
			//...
			//...
		break;
		
		case PING_CMD: //ignore the data, it is used to keep the connection alive
		break;
		
		//... other cases
	}
}