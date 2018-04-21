/// @description Define game constants (macros) and global scope variable (globals)

//macros
#macro INPUT_CMD 0
#macro DATA_CMD 1
#macro PING_CMD 2

#macro NETWORK_LOGIN 0
#macro NETWORK_PLAY 1


//globals
global.network_protocol = network_socket_udp //**note, if UDP is found to be too unreliable, switch to the more reliable, but slower TCP
global.network_ip = "127.0.0.1"
global.player_name = "PLAYER"
global.network_state = NETWORK_LOGIN