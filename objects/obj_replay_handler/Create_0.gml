/// @description 
replay_buffer = -1 //the buffer
header_string = "" //the header string
//the outputs from when the header string is parsed
match_room = -1 //the room the match is in
stocks = -1 //the amount of stocks
time = -1 //the maximum length of the match
player_number = -1 //the number of players
player_name = [] //the name of the player
player_character = [] //the character of the player
player_pallet = [] //the pallet of the player
player_col = [] //the colour belnd of the player
input_array = [] //the inputs of the players
old_axis = [] //old axis
//sticky inputs
sticky_attack = []
sticky_dodge = []
sticky_jump = []
sticky_special = []
global.match_frame = -1000 //make sure match frame only reaches 0 when obj_match_handler is created
active = true;
wait = false;
if (global.debug) { show_debug_message(object_get_name(event_object) + " " + string(event_type) + "-" + string(event_number)) }