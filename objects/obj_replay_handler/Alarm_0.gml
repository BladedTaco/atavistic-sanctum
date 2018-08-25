/// @description failsafe end alarm
if (instance_exists(obj_match_handler)) { //if the replay hasnt ended
	show_message("Replay has been desynced, ending game.")
	scr_end_game(2, 0)	
}
