/// @description 
if (visible) { //only do code if active
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
		if (obj_input.input_array[i, ATTACK]) { //if wanting to leave menu
			if (ready[i] < 1) {
				ready[i] = max(ready[i], 0.02) //set ready if it itsnt already
			} else if (ready[i] = 1) {
				ready[i] = 1.05 //set ready to leave menu
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
			save_replay = true;	
		}
	}

	if ((_exit) and (alarm[0] < 0)) { //exit when all players are ready to exit
		alarm[0] = MENU_DELAY	
	}
}