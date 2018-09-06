/// @description end training alarm
if (room = rm_menu) { //if in the menu room
	obj_menu_vault.alarm[0] = GAME_SPEED - 1 //set input delay
	instance_destroy(); //destroy self
} else { //in the match room
	//create the vault menu
	with (instance_create(-GUI_WIDTH, 0, obj_menu_vault)) {
		menu_index = 4	
	}
	room_goto(rm_menu) //go to the menu room
	room_speed = GAME_SPEED //reset game speed
	alarm[1] = 1 //set this alarm to trigger again once rooms are changed
	global.input_buffer_length = 6 //reset input lag
	global.show_ui = true //reset ui visibility
	global.show_hitboxes = false //reset hitbox visibility
}