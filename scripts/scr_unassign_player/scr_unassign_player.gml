///@func scr_unassign_player(player)
///@param player - the player to unassign
///@desc unassigns the given player from the character select menu

with (obj_menu_char_select) {
	player_number -= 1 //reduce player number
	global.player_number -= 1 //reduce global player number
	for (var o = argument[0]; o < player_number; o++) {  //for each player
		scr_move_player(o + 1, o) //move all players down a spot
	}
	//with all name menus, free surfaces so they are resized and redrawn
	if (instance_exists(obj_menu_name)) {
		with (obj_menu_name) {
			if (player > argument[0]) { //if above the deleted player
				player -= 1; //shift player number down
			}
			player_number -= 1;
			//free all name clip surfaces so they automatically resize
			if (surface_exists(clip_surface)) {
				surface_free(clip_surface)
			}
		}
	}
	obj_input.alarm[1] = GAME_SPEED*0.25 //stop controller from reconnecting instantly	
}