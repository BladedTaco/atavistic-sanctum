///@func scr_init_controller(player_number, controller_port)
///@param player_number - the number of the player
///@param controller_port - the number of the port of the controller
///@desc intialises the base inputs for the given controller for the given player
switch (gamepad_get_description(argument[1])) {
	case "MAYFLASH GameCube Controller Adapter":
		scr_initialise_controller_inputs(argument[0], 1)
	break;
	default: 
		scr_initialise_controller_inputs(argument[0], 0)
	break;
}
controller[argument[0]] = true
controller_number[argument[0]] = argument[1]