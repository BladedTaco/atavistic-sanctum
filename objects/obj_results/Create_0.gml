/// @description 
visible = false
for (var i = 0; i < global.player_number; i++) {
	kills[i, 0] = noone
	deaths[i, 0] = noone
	pal_surface[i] = -1
	character[i] = -1
	name[i] = ""
	img_blend[i] = -1
	player_col[i] = -1
	real_placing[i, 0] = -1 //player number
	real_placing[i, 1] = -1 //placing value
	real_placing[i, 2] = -1 //placing position
	for (var o = 0; o < global.player_number; o++) {
		kill_count[i, o] = 0 //kills
		death_count[i, o] = 0 //deaths
	}
	ready[i] = 0 //whether the player has readied up to leave the menu
}
placing[0] = -1
num = 0
replay_file = -1
replay_file_string = ""
save_replay = false

alarm[0] = -1
y = GUI_HEIGHT
x = 0