/// @description get and handle inputs/ input buffer

for (var i = 0; i < global.player_number; i++) {
	if (player_is_local[i]) {
		scr_get_input(i, controller[i], controller_number[i])
	} else {
		scr_input_buffer_nonlocal(i)	
	}





scr_input_buffer_nonlocal(1)



}


if (keyboard_check_pressed(ord("G"))) {
	var j = 0
	if (controller_number[j] = -1) {
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
		if (o = 12) { exit } //terminate if no controller found
		controller_number[j] = o //else assign controller
		controls_set[j] += 1 //increment controls set
	} else {
		var o = controller_number[j]
		if (controls_set[j] = 1) {
			for (var i = gp_face1; i <= gp_axisrv; i++) {
				button[i - gp_face1, 0] = gamepad_button_check(o, i)
				button[i - gp_face1, 1] = gamepad_axis_value(o, i)
			}
		} else {
			if (controls_set[j] < 22) { //if still setting controls
				if (controls_set[j] < 16) { //button
					for (var i = gp_face1; i <= gp_axisrv; i++) {
						if (gamepad_button_check(o, i) != button[i-gp_face1, 0]) {
							button_const_array[controls_set[j]-2] = i	
							break;
						}
					}
				} else if (controls_set[j] < 18) { //trigger
					for (var i = gp_face1; i <= gp_axisrv; i++) {
						if (abs(gamepad_axis_value(o, i) - button[i-gp_face1, 1]) > 0.25) {
							axis[j, controls_set[j] - 12] = sign(gamepad_axis_value(o, i))
							button_const_array[controls_set[j]-2] = i	
							break;
						}
					}
				} else { //directional stick
					for (var i = gp_face1; i <= gp_axisrv; i++) {
						if (abs(gamepad_axis_value(o, i) - button[i-gp_face1, 1]) > 0.25) {
							axis[j, controls_set[j] - 18] = sign(gamepad_axis_value(o, i))
							button_const_array[controls_set[j]-2] = i	
							break;
						}
					}
				}
			} else {
				controls_set[j] = 0	
				for (var i = 0; i < 20; i++) {
					button_const_array[i]  = -1	
					controller_number[j] = -1
				}
			}
		}
		controls_set[j] += 1 //increment controls set
	}
}