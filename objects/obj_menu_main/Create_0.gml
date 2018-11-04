/// @description init variables
menu_option[0] = "FIGHT"
menu_option[1] = "ONLINE"
menu_option[2] = "COMING SOON" //"STORY"
menu_option[3] = "VAULT"
menu_option[4] = "EXIT"
menu_sprite[0] = spr_menu_sword
menu_sprite[1] = spr_menu_globe
menu_sprite[2] = spr_menu_book
menu_sprite[3] = spr_menu_chest
menu_sprite[4] = spr_menu_exit
menu_index = 0
old_menu_index = 0
draw_count = 0
active = false
alarm[0] = MENU_DELAY
alarm[1] = -1

global.input_buffer_length = 6 //reset input lag