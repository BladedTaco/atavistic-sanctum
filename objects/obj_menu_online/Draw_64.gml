/// @description 
draw_set_font(fnt_pixel_16)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour(c_silver)

var _xx = x
var _yy = y
draw_rectangle(_xx, _yy, _xx + GUI_WIDTH, _yy + GUI_HEIGHT, false)
_yy = y + GUI_HEIGHT*0.5
for (var i = 0; i < menu_length; i++) {
	_xx = x + GUI_WIDTH*0.25 + GUI_WIDTH*0.5*i
	if (menu_index = i) {
		draw_set_colour(c_yellow)
		draw_rectangle(_xx - GUI_WIDTH*0.21, _yy - GUI_HEIGHT*0.21, _xx + GUI_WIDTH*0.21, _yy + GUI_HEIGHT*0.21, false)
		draw_set_colour(c_teal)
	} else {
		draw_set_colour(c_navy)
	}
	draw_rectangle(_xx - GUI_WIDTH*0.2, _yy - GUI_HEIGHT*0.2, _xx + GUI_WIDTH*0.2, _yy + GUI_HEIGHT*0.2, false)
	draw_text_outlined(_xx, _yy - 16, c_black, c_white, menu_option[i], 16)
}