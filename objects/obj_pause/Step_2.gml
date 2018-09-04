/// @description check for change in pause state
if (paused != obj_input.paused) { //if pause state has changed
	paused = obj_input.paused 
	with (obj_input) { 
		event_user(0) //pause or unpause	
	}
}

