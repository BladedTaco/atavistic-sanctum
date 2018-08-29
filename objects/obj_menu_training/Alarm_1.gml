/// @description 
if (room = rm_menu) {
	obj_menu_vault.alarm[0] = GAME_SPEED - 1
	instance_destroy();
} else {
	with (instance_create(-GUI_WIDTH, 0, obj_menu_vault)) {
		menu_index = 4	
	}
	room_goto(rm_menu)
	room_speed = GAME_SPEED
	alarm[1] = 1
	global.input_buffer_length = 6
	global.show_ui = true
	global.show_hitboxes = false
}