/// @description 
menu_option[0] = "NAMES/PROFILES" //name and profile creation and deletion
menu_option[1] = "CONTROLLERS" //change default configurations for controllers
menu_option[2] = "RULES" //change default match rules
menu_option[3] = "SOUND" //change global sound levels
menu_option[4] = "DEBUG" //enable or disable debug and show debug overlay
menu_index = 0
old_menu_index = 0
draw_count = 0
active = false
alarm[0] = MENU_DELAY
sub_menu = false //if in a sub menu
creator = noone