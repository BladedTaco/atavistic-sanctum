///@func scr_initialise_keyboard_inputs(player_number)
///@param player_number - the number of the player using keyboard controls
///@desc initialises one slot to be keyboard controls, call after controller initialisation


var _file = file_text_open_read("default_keyboard_controls.txt") //open keyboad controls file

var i = 0
do {
	button_const_array[argument[0], i + 20] = file_text_read_real(_file) //read the unicode identifer
	file_text_readln(_file) //go to next line
	button_array[argument[0], i] = file_text_read_real(_file) //read the input array entry it corresponds to
	file_text_readln(_file) //go to next line
	i++ //increment i
} until (file_text_eof(_file)) //until end of file

c_stick_action[argument[0]] = C_SMASH_ATTACK //action the c_stick maps to
c_stick_deadzone[argument[0]] = 0.1 //the deadzone for the c_stick
l_stick_deadzone[argument[0]] = 0.1 //the deadzone for the left stick
l_stick_neutral[argument[0]] = 0.5 //the point where a input is considered not neutral
axis[argument[0], 0] = 1 //l horizontal multiplier
axis[argument[0], 1] = 1 //l vertical multiplier
axis[argument[0], 2] = 1 //r horizontal multiplier
axis[argument[0], 3] = 1 //r vertical multiplier
axis[argument[0], 4] = 1 //l trigger multiplier
axis[argument[0], 5] = 1 //r trigger multiplier
controls_set[argument[0]] = 0 //stage of control configuration
button[argument[0], 0] = 0 //initial controller configuartion
smash[argument[0]] = 0.2 //difference needed for a dash

controller[argument[0]] = false //if this player is using a controller
controller_number[argument[0]] = -1 //the slot number of the controller the player is using
player_is_local[argument[0]] = true; //if player is locally controlled
sticky_jump[argument[0]] = false //make it only jump multiple times on multiple presses
sticky_dodge[argument[0]] = false //make it only dodge multiple times on multiple presses