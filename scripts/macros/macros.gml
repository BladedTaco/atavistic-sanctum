/// @description Define game constants (macros) and global scope variable (globals)

//macros
//network command identifiers
#macro INPUT_CMD 0
#macro DATA_CMD 1
#macro PING_CMD 2

//network states
#macro NETWORK_LOGIN 0
#macro NETWORK_PLAY 1

//input array references
#macro	XAXIS 0			
#macro	YAXIS 1			
#macro	ATTACK 2		
#macro	SPECIAL 3		
#macro	JUMP 4			
#macro	PAUSE 5			
#macro	SHIELD 6		
#macro	GRAB 7			
#macro	TAUNT 8			
#macro	TILT 9			
#macro	ALT_XAXIS 10	
#macro	ALT_YAXIS 11	
#macro	LEFT_STICK 12	
#macro	RIGHT_STICK	13	

//globals
global.network_protocol = network_socket_udp //**note, if UDP is found to be too unreliable, switch to the more reliable, but slower TCP
global.network_ip = "127.0.0.1"
global.player_name = "PLAYER"
global.network_state = NETWORK_LOGIN