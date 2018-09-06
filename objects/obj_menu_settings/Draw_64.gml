/// @description draw gui elements
if (sub_menu) { //if in a sub menu
	image_blend = c_gray //fade menu grey
} else {
	image_blend = c_white //keep menu unfaded
}
//set variables and draw options
var _yy = y
var _xx = x
var _percent = alarm[0]/MENU_DELAY
draw_set_font(fnt_pixel_4)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_colour($8f3f4e)
draw_rectangle(_xx, _yy, _xx + GUI_WIDTH, _yy + GUI_HEIGHT, false) //draw background rectangle
for (var i = 0; i < array_length_1d(menu_option); i++) { //for each menu option
	_yy = y + 70 + 80*i
	if (i = menu_index) { //if its selected
		//draw the menu option and text protruding from the rest
		_xx = x - 80*_percent*(old_menu_index != menu_index)
		draw_sprite_ext(spr_menu_item_selected, 0, _xx, _yy, 2, 2, 0, image_blend, 1)
		draw_text_outlined(_xx + 130, _yy + 40, c_black, c_white, menu_option[i], 4)
	} else if (i = old_menu_index) { //if it was selected last
		//retract the menu option and text and fade it slightly
		_xx = x + (80*_percent - 80)*(old_menu_index != menu_index)
		draw_sprite_ext(spr_menu_item_selected, 0, _xx, _yy, 2, 2, 0, c_gray, 1)
		draw_text_outlined(_xx + 130, _yy + 40, c_dkgray, c_ltgray, menu_option[i], 4)
	} else { //normal menu option
		//draw the menu option and text
		_xx = x
		draw_sprite_ext(spr_menu_item, 0, _xx, _yy, 2, 2, 0, image_blend, 1)
		draw_text_outlined(_xx + 50, _yy + 40, c_black, c_white, menu_option[i], 4)
	}
}