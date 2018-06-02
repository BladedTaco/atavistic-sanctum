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

// types of entries for obj_input.input_array[x, 9]
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

// types of states the characters can be in
#macro GROUNDED 0
#macro SPEED_UP 1
#macro WALKING 2
#macro DASHING 3
#macro RUNNING 4
#macro JUMPING 5 //only describes jumpsquat, once in air, state is airborne
#macro AIRBORNE 6 //describes being in the air, including moving hitstun
#macro FREEFALL 7
#macro TILT_ATTACK 8
#macro SMASH_ATTACK 9
#macro SPECIAL_ATTACK 10
#macro LEDGE 11
#macro LEDGE_ALT 12 //describes any type of action performed on the ledge
#macro LANDING 13 //only describes landing lag
#macro DODGING 14
#macro AIR_DODGING 15
#macro SHIELDING 16
#macro HIT_STUN 17 //describes static hitstun
#macro TECHING 18
#macro JUMP_RISE 19 //describes holding jump after pressing it
#macro AIR_ATTACK 20
#macro GRABBING 21 //describes performing a grab
#macro HOLDING 22 //describes holding a grab with a character held


//character identiiers
#macro BAL 0
#macro GEO 1
#macro MAC 2
#macro ETH 3


//hitbox constants
#macro NULL -10
#macro RECTANGLE 1
#macro CIRCLE 2
#macro IN 361 //direction towards centre
#macro OUT 362 //direction away from centre
#macro DIR 363 //direction image angle
#macro HOLD 365, 365, 365 //direction irrelevant, its a grab



//globals
global.network_protocol = network_socket_tcp //**note, if UDP is found to be too unreliable, switch to the more reliable, but slower TCP
global.network_ip = get_string("enter ip", "127.0.0.1")//"127.0.0.1"

global.advance = false

global.network_port = 6510
global.player_name = "PLAYER"
global.network_state = NETWORK_PLAY
global.match_frame = 0
global.input_buffer_length = 6
global.max_players = 8
global.game_version = "1.0.0"
global.client = -1
global.player_number = 0
global.local_players = 1
global.wait = false

//variables used to pass in info for a bbox's create event
global.bbox_maj = 0
global.bbox_min = 0
global.bbox_dir = 0
global.bbox_shape = CIRCLE


global.num = 0

global.coll[0] = 0
global.coll[1] = 0
global.coll[2] = 0
global.coll[3] = 0
global.coll[4] = 0
global.coll[5] = 0
global.coll[6] = 0
global.coll[7] = 0
//enums
enum _IMPULSE { //define an impulse enumeration field
	_AIR_DODGE = 5, //air dodge impulse (instant)
	_ROLL = 10, //roll impulse (instant)
	_WALK = 0.5, //walking impulse (ongoing)
	_RUN = 1, //running impulse (ongoing)
	_DASH = 5, //dashing impulse (instant)
	_JUMP = 20, //jumping impulse (instant)
}


add_moves() //add all of the attacks of the characters into memory (very very intensive)