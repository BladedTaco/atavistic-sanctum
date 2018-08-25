/// @description 
if (paused != obj_input.paused) {
	paused = obj_input.paused
	with (obj_input) {
		event_user(0) //pause or unpause	
	}
}
obj_input.pause = id //set obj inputs pause object


