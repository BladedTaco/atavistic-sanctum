/// @description control characters
old_axis = obj_input.old_axis

if (!instance_exists(obj_replay_handler)) { //dont record replay during a replay
	input_array = obj_input.input_array
	scr_record_replay() //record this frames inputs to replay file
} else {
	input_array = obj_replay_handler.input_array
}

if (starting <= 0) {
	scr_control_character()
}
