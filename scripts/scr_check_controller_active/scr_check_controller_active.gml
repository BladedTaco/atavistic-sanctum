///@func scr_check_controller_active(controller_number)
///@param controller_number - the port of the controller
///@desc returns if the controller is being used

//check for large stick input
if (abs(gamepad_axis_value(argument[0], gp_axislh)) + abs(gamepad_axis_value(argument[0], gp_axislv))
 + abs(gamepad_axis_value(argument[0], gp_axisrh)) /*+ abs(gamepad_axis_value(argument[0], gp_axisrv))*/ > 0.5) {
	return true	//if found return true
}
//check for face button input
if (gamepad_button_check(argument[0], gp_face1) or gamepad_button_check(argument[0], gp_face2) 
or gamepad_button_check(argument[0], gp_face3) or gamepad_button_check(argument[0], gp_face4)) {
	return true //if found return true
}
return false //if no input found, return false