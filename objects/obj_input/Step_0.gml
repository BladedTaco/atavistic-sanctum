/// @description get and handle inputs/ input buffer

for (var i = 0; i < global.player_number; i++) {
	if (player_is_local[i]) {
		scr_get_input(i, controller[i], controller_number[i])
	} else {
		scr_input_buffer_nonlocal(i)	
	}
	
}


if (room = rm_menu) { //if in a menu room
	if (alarm[1] <= 0) {
		if (global.player_number < 8) {
			for (var i = 0; i < 12; i++) {
				if (gamepad_is_connected(i)) {
					//if the controller is not already a player		
					//check for input
					//if input found, register it as a new player
					for (var o = 0; o < global.player_number; o++) {
						if (controller_number[o] = i) {
							o = -1 //set o so that the below check never executes
							break; //break current loop
						}
					}
					if (o >= global.player_number) { //if the entire loop above executed, player isnt already connected
						if (scr_check_controller_active(i)) {
							scr_init_controller(o, i) //add the player
							global.player_number += 1 //increase player number
							player_is_local[o] = true
						}
					}
				}
			}
		}
		if (keyboard_check_pressed(vk_anykey) and (global.player_number < 8)) {
			for (var o = 0; o < global.player_number; o++) {
				if (controller[o] = false) {
					break;	
				}
			}
			if (o >= global.player_number) { //if the entire loop above executed, player isnt already connected
				scr_initialise_keyboard_inputs(o) //add the player
				global.player_number += 1 //increase player number
				player_is_local[o] = true;
				controller[o] = false;
			}
		}
	}
}







{ //CUSTOM CONTROL SETTINGS
	var j = 1; //the player number to set the controls for MOVE THIS CODE SOMEWHERE BETTER
	while (controls_set[j] = 22) {
		j++	
	}
	if (gamepad_is_connected(controller_number[j])) {
		if (keyboard_check_pressed(ord("H"))) {
			if (controls_set[j] = 1) {
				scr_init_controller(j, controller_number[j])
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
}