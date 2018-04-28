/// @description broadcast server

buffer_seek(broadcast_buffer, buffer_seek_start, 0); //seek the start of the buffer
buffer_write(broadcast_buffer, buffer_string, server_name); //write the server name to the buffer
network_send_broadcast(server, 6511, broadcast_buffer, buffer_tell(broadcast_buffer)); //broadcast the server name with a padded data packet

alarm[0] = room_speed //set this alarm to rebroadcast in one second
