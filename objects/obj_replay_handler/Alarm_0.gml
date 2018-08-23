/// @description failsafe end alarm
if (instance_exists(obj_match_handler)) { //if the replay hasnt ended
	show_message("Replay has been desynced, ending game.")
	scr_end_game(2, 0)	
}
show_debug_message(object_get_name(event_object) + " " + string(event_type) + "-" + string(event_number))