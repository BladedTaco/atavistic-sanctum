/// @description control characters
old_axis = obj_input.old_axis
input_array = obj_input.input_array

if (!instance_exists(obj_replay_handler)) { //dont record replay during a replay
	scr_record_replay() //record this frames inputs to replay file
}

if (starting <= 0) {
	scr_control_character()
}
