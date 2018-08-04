/// @description 
var _xx = x
var _yy = y
var j = GUI_WIDTH*0.1
draw_set_colour($4ad64a)
draw_set_font(fnt_pixel_3)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_rectangle(_xx - GUI_WIDTH*0.5 + j, _yy - GUI_HEIGHT*0.5 + j, _xx + GUI_WIDTH*0.5 - j, _yy + GUI_HEIGHT*0.5 - j, false)
draw_text_outlined(_xx, _yy - GUI_HEIGHT*0.475 + j, c_black, c_white, name, 3)
if (state = 2) { //name menu
	//draw_rectangle(_xx + sub_index*GUI_WIDTH*0.05, _yy - GUI_HEIGHT*0.4 + j
	draw_set_font(fnt_pixel_4)
	draw_text_outlined(_xx, _yy - GUI_HEIGHT*0.41 + j, c_black, c_white, sub_name, 4)
	draw_set_font(fnt_pixel_3)
	for (var i = 0; i < menu_length - 1; i++) {
		_xx = x + (i div 6)*GUI_WIDTH*0.11 - GUI_WIDTH*0.325
		_yy = y + (i mod 6)*GUI_HEIGHT*0.075 - GUI_HEIGHT*(0.125 - 0.02)
		if (menu_index = i) {
			draw_set_colour($ca466a)
		} else {
			draw_set_colour($732463)
		}
		draw_rectangle(_xx - GUI_WIDTH*0.03, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.03, _yy + GUI_HEIGHT*0.03, false)
		draw_text_outlined(_xx, _yy - 4, c_black, c_white, menu_option[i], 3)
	}
	if (active) { //menu options aren't set for first draw, so avoid this throwing an error
		_xx = x + GUI_WIDTH*0.27
		_yy = y + GUI_HEIGHT*0.08
		if (menu_index = i) {
			draw_set_colour($ca466a)
		} else {
			draw_set_colour($732463)
		}
		draw_rectangle(_xx - GUI_WIDTH*0.08, _yy - GUI_HEIGHT*0.15, _xx + GUI_WIDTH*0.08, _yy + GUI_HEIGHT*0.15, false)
		draw_text_outlined(_xx, _yy - 4, c_black, c_white, menu_option[i], 3)
	}
} else { //normal menu
	for (var i = 0; i < menu_length; i++) {
		_xx = x + (i div 6)*GUI_WIDTH*0.35 - GUI_WIDTH*0.175
		_yy = y + (i mod 6)*GUI_HEIGHT*0.1 - GUI_HEIGHT*(0.25 - 0.025)
		if (menu_index = i) {
			draw_set_colour($ca466a)
		} else {
			draw_set_colour($732463)
		}
		draw_rectangle(_xx - GUI_WIDTH*0.125, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.125, _yy + GUI_HEIGHT*0.03, false)
		draw_text_outlined(_xx, _yy - 4, c_black, c_white, menu_option[i], 3)
	}
}