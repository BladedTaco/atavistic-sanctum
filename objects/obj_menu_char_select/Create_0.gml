/// @description initialise variables
for (var i = 0; i < 8; i++) {
	cursor_x[i] = -1 //the x position of the player cursor
	cursor_y[i] = -1 //the y position of the player cursor
	character[i] = -1 //the character selected
	pal_sprite[i] = pal_bal //the pallet swap sprite
	pallet[i] = -1 //pallet for the character selected
	sprite[i] = -1 //sprite for the character selected
	name[i] = "P" + string(i+1)
	player_col[i] = make_colour_hsv((i*255)/8, 255, 255) //variable for player colour
	col[i] = 0 //variable for collision found
	sub_menu[i] = false //if the player is in a sub menu
	obj_input.controller[i] = false
	obj_input.controller_number[i] = -1
}

pal[0] = 0
pal[1] = 0
pal[2] = 0
pal[3] = 0

stocks = global.stocks
time = global.time
player_number = 0
active = false

scr_reset_players() //reset players