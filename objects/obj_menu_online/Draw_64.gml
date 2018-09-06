/// @description draw menu
//set draw optoins
draw_set_font(fnt_pixel_16)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour(c_silver)

var _xx = x
var _yy = y
draw_rectangle(_xx, _yy, _xx + GUI_WIDTH, _yy + GUI_HEIGHT, false) //draw background
_yy = y + GUI_HEIGHT*0.5
for (var i = 0; i < menu_length; i++) { //for the length of the menu
	_xx = x + GUI_WIDTH*0.25 + GUI_WIDTH*0.5*i //get option position
	if (menu_index = i) { //if selected
		draw_set_colour(c_yellow) //draw a selector reactangle behind the option
		draw_rectangle(_xx - GUI_WIDTH*0.21, _yy - GUI_HEIGHT*0.21, _xx + GUI_WIDTH*0.21, _yy + GUI_HEIGHT*0.21, false)
		draw_set_colour(c_teal) //set draw colour to teal
	} else { // if not selected
		draw_set_colour(c_navy) //set colour to navy 
	}
	//draw the menu option
	draw_rectangle(_xx - GUI_WIDTH*0.2, _yy - GUI_HEIGHT*0.2, _xx + GUI_WIDTH*0.2, _yy + GUI_HEIGHT*0.2, false)
	draw_text_outlined(_xx, _yy - 16, c_black, c_white, menu_option[i], 16)
}