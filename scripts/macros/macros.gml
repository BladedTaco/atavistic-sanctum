/// @description Define game constants (macros) and global scope variable (globals)



//macros

//settings
#macro GAME_SPEED 60 //the steps per second to maintain

//network command identifiers
#macro INPUT_CMD 0
#macro DATA_CMD 1
#macro PING_CMD 2

//network states
#macro NETWORK_LOGIN 0
#macro NETWORK_LOBBY 1
#macro NETWORK_PLAY 2

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

// types of entries for input_array[x, 9]
#macro NEUTRAL_MOVE 0 
#macro TILT_MOVE 1
#macro SMASH_MOVE 2

// alternate stick input states
#macro C_SMASH_ATTACK 0
#macro C_TILT_ATTACK 1
#macro C_SPECIAL_ATTACK 2
#macro C_GRAB 3
#macro C_ROLL 4
#macro C_TAUNT 5
#macro C_NEUTRAL_ATTACK 6
#macro C_NEUTRAL_SPECIAL 7

//globals
global.network_protocol = network_socket_tcp //**note, if UDP is found to be too unreliable, switch to the more reliable, but slower TCP
global.network_ip = "127.0.0.1"
global.network_port = 6510
global.player_name = "PLAYER"
global.network_state = NETWORK_PLAY
global.match_frame = 0
global.input_buffer_length = 6
global.max_players = 8
global.game_version = "1.0.0"
global.client = -1
global.player_number = 1
global.wait = false