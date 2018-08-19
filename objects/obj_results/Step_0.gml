/// @description 
if (visible and (y = 0)) { //only do code if active
	var _exit = true
	for (var i = 0; i < num; i++) { //for each player
		if (ready[i] <= 1) {
			if (ready[i] > 0) { //if readying up, increase ready up to 1 incrementally
				ready[i] = clamp(ready[i] + 0.02, 0, 1)	
			}
			_exit = false
		} else if (ready[i] < 4.5) {
			ready[i] = clamp(ready[i] + 0.05, 1, 4.5)	
			_exit = false
		}
		if (obj_input.input_array[i, ATTACK] and !obj_input.sticky_attack[i]) { //if wanting to leave menu
			obj_input.sticky_attack[i] = true
			if (instance_exists(obj_replay_handler)) { //end of replay
				for (var o = 0; o < num; o++) {
					if (ready[o] < 0.02) {
						ready[o] = 0.02
					} else if (ready[o] < 1.05) { //if not fully readied
						ready[o] = 1.05 //set to be ready	
					}
				}
			} else { //end of match
				if (ready[i] < 1) {
					ready[i] = max(ready[i], 0.02) //set ready if it isnt already
				} else if (ready[i] = 1) {
					ready[i] = 1.05 //set ready to leave menu
				}
			}
		}
		if (obj_input.input_array[i, SPECIAL] and !obj_input.sticky_special[i]) { //if wanting to undo a ready action
			obj_input.sticky_special[i] = true
			if (ready[i] <= 1) {
				ready[i] = 0 //set ready to base state
			} else {
				ready[i] = 1 //set ready to first ready	
			}
		}
		if (obj_input.input_array[i, GRAB]) {
			if (!save_replay) {
				obj_save_replay.visible = true
				save_replay = true;
			}
		}
		if (obj_input.input_array[i, PAUSE] and !obj_input.sticky_pause[i]) { //pause means exit menu for all
			obj_input.sticky_pause[i] = true;
			for (var o = 0; o < num; o++) {
				if (ready[o] < 0.02) { //if not at all readied
					ready[o] = 0.02 //make ready stage 1
				} else if (ready[o] < 1.05) { //if not fully readied
					ready[o] = 1.05 //set to be ready	
				}
			}
		}
	}

	if ((_exit) and (alarm[0] < 0)) { //exit when all players are ready to exit
		alarm[0] = MENU_DELAY	
	}
}