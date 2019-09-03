///@desc Define game constants (macros) and global scope variable (globals)


randomise() //randomise the seed for things such as random character select
show_debug_overlay(debug_mode)
window_set_caption("Atavistic Sanctum is now loading...")

//macros

window_set_caption("Defining Macros")
//settings
#macro GAME_SPEED 60 //the steps per second to maintain

//network command identifiers
#macro INPUT_CMD 0
#macro DATA_CMD 1
#macro PING_CMD 2
#macro PLAYER_CMD 3
#macro CHAR_CMD 4
#macro NAME_CMD 5
#macro GAME_CMD 6 

//network states
#macro NETWORK_LOGIN 0
#macro NETWORK_LOBBY 1
#macro NETWORK_PLAY 2
#macro NETWORK_JOIN 3

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
#macro  NOTHING 14

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
#macro FREEFALL 7 //describes the helpess state
#macro TILT_ATTACK 8
#macro SMASH_ATTACK 9
#macro SPECIAL_ATTACK 10
#macro LEDGE 11
#macro LEDGE_ALT 12 //describes any type of action performed on the ledge
#macro LANDING 13 //only describes landing lag
#macro DODGING 14
#macro AIR_DODGING 15
#macro SHIELDING 16 //describes shield and hold shield animation
#macro HIT_STUN 17 //describes static hitstun
#macro TECHING 18 //describes the time the character is able to tech, not the actual tech
#macro JUMP_RISE 19 //describes holding jump after pressing it
#macro AIR_ATTACK 20
#macro GRABBING 21 //describes performing a grab
#macro HOLDING 22 //describes holding a grab with a character 
#macro SPEED_DOWN 23
#macro DASH_SLOW 24
#macro UNSHIELDING 25 //describes unshield animation
#macro CROUCHING 26 //describes all 3 crouching states
#macro HELPLESS 27 //airborne from an attacks knocback
#macro GRABBED 28 //being grabbed
#macro TAUNTING 29 //taunting
#macro DEAD 30 //dead

//character identiiers
#macro BAL 0
#macro MAC 1
#macro GEO 2
#macro ETH 3
#macro CHARACTER_NUMBER 4 //TODO: always make sure this is the number of the highest character + 1

//hitbox constants
#macro NULL -10
#macro RECTANGLE 1
#macro CIRCLE 2
#macro TRIANGLE 3
#macro IN 361 //direction towards centre
#macro OUT 362 //direction away from centre
#macro DIR 363 //direction image angle
#macro HOLD 365, 365, 365 //direction irrelevant, its a grab
#macro HOLD_DIR 365 //just the direction of the grab


#macro GROUND_HEIGHT 10 //half the height from the top of the ground that is considered acceptable as on top
#macro ATTACKER_REFRESH (GAME_SPEED*10) //the time an attacker lasts

#macro GUI_HEIGHT 540//display_get_gui_height()
#macro GUI_WIDTH 960//display_get_gui_width()
#macro MENU_DELAY (GAME_SPEED/6)


window_set_caption("Defining Globals")

//globals
global.network_protocol = network_socket_tcp //**note, if UDP is found to be too unreliable, switch to the more reliable, but slower TCP
global.network_ip = "127.0.0.1"//get_string("enter ip", "127.0.0.1")

global.advance = false


global.network_port = 6510
global.player_name = "PLAYER"
global.network_state = NETWORK_JOIN
global.match_frame = 0
global.input_buffer_length = 5
global.max_players = 8
global.game_version = "1.0.0"
global.client = -1
global.player_number = 1
global.local_players = 1
global.wait = false
global.paused = false
global.debug = false

//variables used to pass in info for a bbox's create event
for (var i = 10; i >= 0; i--) {
	global.bbox[i] = 0
}

//initialise global variables for ellipse-ellipse collision testing
global.maxIterations = 10
global.innerPolygonCoef[0] = 0
global.outerPolygonCoef[0] = 0
for (var t = 0; t <= global.maxIterations; t++) {
	var numNodes = 4 << t;
	global.innerPolygonCoef[t] = 0.5/cos(2*pi/numNodes);
	global.outerPolygonCoef[t] = 0.5/(cos(pi/numNodes)*cos(pi/numNodes));
}

//match variables
global.ground = noone
global.ground_distance = 0
global.eth_angle = 0 //used for eth platform creation
global.player_outside = false
global.show_hitboxes = false
global.show_ui = true
//get the standard rules
if (!file_exists("rules.txt")) {
	var _file = file_text_open_write("rules.txt")
	file_text_write_real(_file, 3); file_text_writeln(_file);
	file_text_write_real(_file, 5); file_text_writeln(_file);
	file_text_write_real(_file, 100); file_text_writeln(_file);
	file_text_write_real(_file, 100); file_text_writeln(_file);
} else {
	var _file = file_text_open_read("rules.txt")
}
global.stocks = file_text_read_real(_file); file_text_readln(_file);
global.time = file_text_read_real(_file); file_text_readln(_file);
global.sound = file_text_read_real(_file); file_text_readln(_file); //global sound percentage
global.music = file_text_read_real(_file); file_text_readln(_file); //global music sound percentage
file_text_close(_file); //close the file


//pallet swap index
global.pallet[BAL] = pal_bal
global.pallet[MAC] = pal_mac
global.pallet[GEO] = pal_geo
global.pallet[ETH] = pal_eth

//hitboxes
global.hitbox_list = [];
global.hurtbox_list = [];


window_set_caption("Defining enums")
//enums
enum _IMPULSE { //define an impulse enumeration field (actual values are divided by 100)
	_AIR_DODGE = 1200, //air dodge impulse (instant)
	_ROLL = 250, //roll impulse (instant)
	_WALK = 25, //walking impulse (ongoing)
	_RUN = 50, //running impulse (ongoing)
	_DASH = 400, //dashing impulse (instant)
	_JUMP = 1000, //jumping impulse (instant)
	_JUMPRISE = 23, //jumprise impulse (ongoing)
	_GRAVITY = 30, //gravity impulse (ongoing)
	_FASTFALL = 150, //fastfall impulse (ongoing)
	_AIR_MOVE = 100, //moving in air (ongoing)
	_FREEFALL = 100, //starting freefall (instant)
	_SUB_DASH = 425, //dash performed during a run in the same direction (instant)
	_RIGIDITY = 5, //the force pushing players apart when they are colliding (ongoing)
	_CLASH = 250, //when a hitbox collides with a hitbox (instant)
	_GRAB = 100, //impulse when peforming a grab (instant)
	_GRAB_RELEASE = 500, //when a grabs timer runs out (instant)
	_SHIELD_BREAK = 5000, //when a shield runs out (instant)
	//attack impulses
	_MAC_SLIDE = 25, //machinations sliding moves (ongoing)
	_MAC_SLIDE_SMALL = 10, //machinations sliding moves (small) (ongoing)
	_MAC_U_THROW = 175, //machinations up throw (ongoing)
	_MAC_D_THROW = 50, //machinationd down throw (ongoing)
	_GEO_U_SPEC = 75, //geos recovery (ongoing)
	_GEO_D_SPEC = 55, //geos down special (ongoing)
	_ETH_U_SPEC = 100, //etheral spirits up special (ongoing)
	_BAL_U_SPEC = 70 //balloony's recovery (ongoing)
}




window_set_caption("Adding Moves")

//add_moves() //add all of the attacks of the characters into memory (very very intensive)


add_moves_autogen()

pal_swap_init_system(shd_pal_swapper); //initialise pallet swap system

draw_set_font(fnt_pixel_2) //set font

window_set_caption("Atavistic Sanctum")

display_set_gui_size(GUI_WIDTH, GUI_HEIGHT)

for (var i = spr_bal_base; i <= spr_eth_special_neutral; i++) {
	sprite_set_speed(i, sprite_get_speed(i)/GAME_SPEED, spritespeed_framespergameframe)
}
