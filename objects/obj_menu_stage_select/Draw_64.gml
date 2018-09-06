/// @description draw menu
//set variables and draw settings
var _xx = x
var _yy = y
draw_set_colour($fa48fa)
draw_set_font(fnt_pixel_3)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
//draw background rectangle
draw_rectangle(_xx + GUI_WIDTH*0.1, _yy + GUI_HEIGHT*0.1, _xx + GUI_WIDTH*0.9, _yy + GUI_HEIGHT*0.9, false)

for (var i = 0; i < array_length_1d(menu_sprite); i++) { //for each menu option
	//get the position to draw it
	_xx = x + GUI_WIDTH*0.2*((i mod 4) + 1)
	_yy = y + GUI_HEIGHT*0.4*(i div 4) + GUI_HEIGHT*0.3
	if (point_in_rectangle(cursor_x, cursor_y, _xx - 80, _yy - 45, _xx + 80, _yy + 45)) { //if being hovered over
		//draw a blue rectangle behind it
		draw_set_colour($da54ad) 
		draw_rectangle(_xx - 90, _yy - 50, _xx + 90, _yy + 50, false)	
	}
	//draw the menu sprite and menu text
	draw_sprite_ext(menu_sprite[i], 0, _xx, _yy, 0.5, 0.5, 0, c_white, 1)
	draw_text_outlined(_xx, _yy + GUI_HEIGHT*0.13, c_black, c_white, menu_option[i], 3)
}
_xx = x
_yy = y

//draw the cursor
draw_sprite_ext(spr_cursor, 0, _xx + cursor_x, _yy + cursor_y, 3, 3, 0, c_white, 1)