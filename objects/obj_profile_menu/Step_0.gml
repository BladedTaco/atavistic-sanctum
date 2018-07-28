/// @description 
if (active = 1) {
	if (alarm[0] <= 0) {
		//do stuff 	
	}
} else {
	if (active < 1) {
		y = GUI_HEIGHT*alarm[0]/(GAME_SPEED*0.25)
	} else {
		y += GUI_HEIGHT/(GAME_SPEED*0.25)
	}
}