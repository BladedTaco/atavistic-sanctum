/// @description 
menu_index = 0
old_menu_index = 0
draw_count = 0
active = true
alarm[0] = MENU_DELAY*2
state = 0
sub_menu = false
creator = noone
x -= GUI_WIDTH/15

for (var i = 0; i < array_length_1d(obj_input.sticky_attack); i++) {
	obj_input.sticky_attack[i] = true
}

event_user(0) //call the menu population event