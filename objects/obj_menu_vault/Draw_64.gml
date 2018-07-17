/// @description 
var _yy = y
var _xx = x
var _percent = alarm[0]/MENU_DELAY
draw_set_font(fnt_pixel_4)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour($5f3f00)
draw_rectangle(_xx, _yy, _xx + GUI_WIDTH, _yy + GUI_HEIGHT, false)
for (var i = 0; i < array_length_1d(menu_option); i++) {
	_yy = y + 70 + 80*i
	if (i = menu_index) {
		_xx = x - 80*_percent*(old_menu_index != menu_index)
		draw_sprite_ext(spr_menu_item_selected, 0, _xx, _yy, 2, 2, 0, c_white, 1)
		draw_text_outlined(_xx + 180, _yy + 40, c_black, c_white, menu_option[i], 4)
	} else if (i = old_menu_index) {
		_xx = x + (80*_percent - 80)*(old_menu_index != menu_index)
		draw_sprite_ext(spr_menu_item_selected, 0, _xx, _yy, 2, 2, 0, c_gray, 1)
		draw_text_outlined(_xx + 180, _yy + 40, c_dkgray, c_ltgray, menu_option[i], 4)
	} else {
		_xx = x
		draw_sprite_ext(spr_menu_item, 0, _xx, _yy, 2, 2, 0, c_white, 1)
		draw_text_outlined(_xx + 100, _yy + 40, c_black, c_white, menu_option[i], 4)
	}
}

_yy = y
_xx = x
if (old_menu_index != menu_index) {
	if (_percent > 0.5) {
		draw_sprite_ext(menu_sprite[old_menu_index], 0, _xx + GUI_WIDTH*(0.75 + (1 - _percent)/2), _yy + GUI_HEIGHT/2, 2, 2, _percent*180 - 180, c_white,  2*(_percent - 0.5))	
	} else {
		draw_sprite_ext(menu_sprite[menu_index], 0, _xx + GUI_WIDTH*(0.75 + _percent/2), _yy + GUI_HEIGHT/2, 2, 2, _percent*180, c_white,  2*(0.5 - _percent))	
	}
} else {
	draw_sprite_ext(menu_sprite[menu_index], 0, _xx + GUI_WIDTH*0.75, _yy + GUI_HEIGHT/2, 2, 2, 0, c_white, 1)	
}