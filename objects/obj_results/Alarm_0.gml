/// @description end alarm
if (instance_exists(obj_replay_handler)) { //come from a replay, go to replay menu
	if (room = rm_menu) { //in the menu room
		//destroy match objects and intialise menu
		obj_menu_replay.alarm[1] = GAME_SPEED - 1
		instance_destroy(obj_replay_handler);
		instance_destroy();
	} else { //in the match room
		//actiavate menu objects and go to their room
		instance_activate_object(obj_menu_replay)
		room_goto(rm_menu)
		room_speed = GAME_SPEED
		alarm[0] = 1
	}
} else { //come from a normal match, go to character select
	if (room = rm_menu) { //in the menu room
		//destroy self and init menu
		obj_menu_char_select.alarm[0] = GAME_SPEED - 1
		instance_destroy();
	} else { //in the match room
		//activate menus and go to their room
		instance_activate_object(obj_menu_char_select)
		room_goto(rm_menu)
		room_speed = GAME_SPEED
		alarm[0] = 1
	}
}