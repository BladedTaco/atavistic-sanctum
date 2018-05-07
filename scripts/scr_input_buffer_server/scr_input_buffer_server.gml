///@func scr_input_buffer_server(-DEPRECATED-)
///@desc -DEPRECATED-

/*


var j = 0
repeat(global.player_number) {
	var _index = global.input_buffer_length*100 + j

	//move all buffer entries down
	repeat (global.input_buffer_length) {
		for (var i = 0; i < 10; i++) {
			obj_input.input_buffer_array[_index, i] = obj_input.input_buffer_array[_index-100, i]
		}
		_index -= 100
	}
	j++
}

