///@func scr_define_input(player_number)
///@param player_number - the number of the player to update the controls of
///@desc used to set controls, returns false when finished after multiple calls

with (obj_input) {
	var j = argument[0]
	
	if (controller_number[j] = -1) { //get controller to configure
		for (var o = 0; o < 12; o++) {
			if (gamepad_is_connected(o)) { 
				for (var i = gp_face1; i <= gp_axisrv; i++) {
					if (gamepad_button_check(o, i)) {
						break;	//loop until gamepad found
					}
				}
				if (i <= gp_axisrv) { break; } //break loop when gamepad with button held found
			} 
		}
		if (o = 12) { return -1 } //terminate if no controller found
		controller_number[j] = o //else assign controller
		other.controller = o
		controls_set[j] += 1 //increment controls set
	} else { //configure current control
		var o = controller_number[j]
		if (controls_set[j] = 1) {
			for (var i = gp_face1; i <= gp_axisrv; i++) {
				button[i - gp_face1, 0] = gamepad_button_check(o, i)
				button[i - gp_face1, 1] = gamepad_axis_value(o, i)
			}
		} else {
			if (controls_set[j] < 22) { //if still setting controls
				button_const_array[j, controls_set[j]-2] = -1 //set to nothing
				if (controls_set[j] < 16) { //button
					for (var i = gp_face1; i <= gp_axisrv; i++) {
						if (gamepad_button_check(o, i) != button[i-gp_face1, 0]) {
							button_const_array[j, controls_set[j]-2] = i	
							break;
						}
					}
				} else if (controls_set[j] < 18) { //trigger
					for (var i = gp_face1; i <= gp_axisrv; i++) {
						if (abs(gamepad_axis_value(o, i) - button[i-gp_face1, 1]) > 0.25) {
							analogue[j] = 0 //set to be an analogue controller
							axis[j, controls_set[j] - 12] = 1/gamepad_axis_value(o, i)
							button_const_array[j, controls_set[j]-2] = i	
							break;
						} else if (abs(gamepad_button_value(o, i) - button[i-gp_face1, 0]) > 0.25) {
							analogue[j] = 2 //set to be a digital controller
							button_const_array[j, controls_set[j]-2] = i	
							break;
						}
					}
				} else { //directional stick
					for (var i = gp_face1; i <= gp_axisrv; i++) {
						if (abs(gamepad_axis_value(o, i) - button[i-gp_face1, 1]) > 0.25) {
							axis[j, controls_set[j] - 18] = 1/gamepad_axis_value(o, i)
							button_const_array[j, controls_set[j]-2] = i	
							break;
						}
					}
				}
			} else {
				controls_set[j] = -1 //set to -1 as it gets incremented below
				for (var i = 0; i < 20; i++) {
					button_const_array[j, i]  = -1	
					controller_number[j] = -1
				}
			}
		}
		controls_set[j] += 1 //increment controls set
		if (controls_set[j] = 22) {
			return false //return that controls are set	
		}
	}
}
return true //return that controls are not finished being set yet