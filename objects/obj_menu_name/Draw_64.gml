/// @description draw menu

// create a surface if it doesn't exist:
if (!surface_exists(clip_surface)) {
    clip_surface = surface_create(ceil(GUI_WIDTH*(1/min(player_number + 1, 8))), ceil(GUI_HEIGHT*0.25));
}
// clear and start drawing to surface:
surface_set_target(clip_surface);
draw_clear_alpha(c_aqua, 1);

//get positiong and set font
var _xx = GUI_WIDTH*(0.5/min(player_number + 1, 8))
var _yy = 0
draw_set_font(fnt_pixel_2)
if (menu_index mod 1 = 0) { //if not moving between menu indexes
	//draw a selection line
	draw_line_width_colour(_xx - 100, _yy + GUI_HEIGHT*0.15, _xx + 100, _yy + GUI_HEIGHT*0.15, 20, c_lime, c_orange)
}
for (var i = 0; i < 7; i++) { //for 7 options
	//get index and offset
	var o = (floor(menu_index) + i + array_length_1d(menu_option)*2 - 3) mod array_length_1d(menu_option)
	var j = i - ((menu_index + 10) mod 1)
	if (o < array_length_1d(menu_option) - 2) { //not last two options
		var _col = c_black	//set colour to black
	} else { //last two options
		var _col = c_red //set colout to red
	}
	//draw menu option and seperating lines
	draw_text_outlined(_xx, _yy + (j)*GUI_HEIGHT*0.05, _col, c_white, menu_option[o], 2)
	draw_line_width_colour(_xx - 50, _yy + (j + 0.5)*GUI_HEIGHT*0.05, _xx + 50, _yy + (j + 0.5)*GUI_HEIGHT*0.05, 5, c_dkgray, c_ltgray)
}

// finish and draw the surface itself
surface_reset_target();
draw_surface(clip_surface, GUI_WIDTH*(player/min(player_number + 1, 8)), GUI_HEIGHT*0.75);
