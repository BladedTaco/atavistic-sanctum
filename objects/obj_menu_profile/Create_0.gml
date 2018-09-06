/// @description init variables
state = -1
name = ""
active = 0
alarm[0] = GAME_SPEED*0.25
creator = noone
menu_option[0] = ""
input_array[0] = -1
controller = -0.5
player_number = clamp(global.player_number + 1, 0, 7)
sub_menu = false
menu_index = 0;
menu_length = 20;
alarm[1] = -1 //setting controls alarm