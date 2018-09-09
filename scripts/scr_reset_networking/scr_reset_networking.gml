///@func scr_reset_networking(change_room)
///@param change_room - optional, if true, changes to main menu from current room
///@desc resets all networking objects and states
if (instance_exists(obj_server)) {
	instance_destroy(obj_server)
}	
if (instance_exists(obj_client)) {
	instance_destroy(obj_client)	
}
global.network_ip = "127.0.0.1"
global.network_state = NETWORK_JOIN



if (instance_exists(obj_server)) {
show_debug_message("SERVER IS: " + string(instance_exists(obj_server)))
}	
if (instance_exists(obj_client)) {
show_debug_message("CLIENT IS HERE")
}


if (argument_count > 0) {
	if (argument[0]) {
		if (room = rm_menu) { //in character select
			//go back to online menu
			scr_reset_players();
			if (instance_exists(obj_menu_char_select)) {
				instance_destroy(obj_menu_char_select)
			} else if (instance_exists(obj_menu_online)) {
				obj_menu_online.active = false
			}
			instance_create(-GUI_WIDTH, 0, obj_menu_main)
		} else { //in a match
			//forfeit
			scr_end_game(2, -1)	
		}
	}
}