/// @description get and handle inputs/ input buffer

for (var i = 0; i < global.player_number; i++) {
	if (player_is_local[i]) {
		scr_get_input(i, controller[i], controller_number[i])
	} else {
		scr_input_buffer_nonlocal(i)	
	}
	
}


var j = 1;
while (controls_set[j] = 22) {
	j++	
}
if (gamepad_is_connected(controller_number[j])) {
	if (keyboard_check_pressed(ord("H"))) {
		if (controls_set[j] = 1) {
			switch (gamepad_get_description(controller_number[j])) {
				case "MAYFLASH GameCube Controller Adapter":
					scr_initialise_controller_inputs(j, 1)
				break;
				default: 
					scr_initialise_controller_inputs(j, 0)
				break;
			}
			controls_set[j] = 22
		}
	}
}

if (keyboard_check_pressed(ord("G"))) {
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
							button_const_array[j, controls_set[j]-2] = i	
							break;
						}
					}
				} else if (controls_set[j] < 18) { //trigger
					for (var i = gp_face1; i <= gp_axisrv; i++) {
						if (abs(gamepad_axis_value(o, i) - button[i-gp_face1, 1]) > 0.25) {
							axis[j, controls_set[j] - 12] = 1/gamepad_axis_value(o, i)
							button_const_array[j, controls_set[j]-2] = i	
							break;
						} else if (gamepad_button_value(o, i) != button[i-gp_face1, 1]) {
							analogue[j] = 2
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
	}
}