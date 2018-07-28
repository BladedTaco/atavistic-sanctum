/// @description 
if (room = rm_menu) {
	obj_menu_char_select.alarm[0] = GAME_SPEED - 1
	instance_destroy();
} else {
	instance_activate_object(obj_menu_char_select)
	room_goto(rm_menu)
	room_speed = GAME_SPEED
	alarm[0] = 1
}
