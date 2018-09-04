/// @description initialise game
if !(instance_exists(obj_menu_char_select) or instance_exists(obj_input) or instance_exists(obj_menu_main)) { //if the start of the game
	macros() //call the macros script
	with (instance_create(0, 0, obj_menu_main)) { //create the main menu
		active = true	//set the main menu to be active
	}
	instance_create(0, 0, obj_input) //create the input handler
	scr_reset_players()	//reset players
	instance_create(0, 0, obj_pause) //create the pause handler
}

instance_destroy(); //destroy self