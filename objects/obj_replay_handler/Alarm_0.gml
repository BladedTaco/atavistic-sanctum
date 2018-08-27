/// @description failsafe end alarm
if (instance_exists(obj_match_handler)) { //if the replay hasnt ended
	show_message_async("Replay has been desynced or someone is a dirty forfeiter, ending game.")
	scr_end_game(2, -1)	
}
