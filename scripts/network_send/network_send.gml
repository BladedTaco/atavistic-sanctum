 ///@func network_send(socket, buffer)
///@desc sends a network packet or udp message based on network architecture
///@desc returns <0 if the function fails to send the given buffer
///@param socket - the socket id of the recipient
///@param buffer - the buffer to send


if (global.network_protocol = network_socket_tcp) { //send data using tcp
	return network_send_packet(argument[0], argument[1], buffer_tell(argument[1])) 
} else { //send data using udp
	return network_send_udp(argument[0], global.network_ip, global.network_port, argument[1], buffer_tell(argument[1]))
}