/// @description 
var _yy = y
var _xx = x
var _percent = alarm[0]/MENU_DELAY
draw_set_font(fnt_pixel_4)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

switch (round(state)) {
	case 0: //name
		draw_text_outlined(_xx + GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.5, c_black, c_white, menu_option[0, 0], 4)
	break;
	
	case 1: //controller
		draw_text_outlined(_xx + GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.5, c_black, c_white, menu_option[1, 0], 4)
	break;
	
	case 2: case 3: //rules and sound
		_yy = y + GUI_HEIGHT*0.4 + GUI_HEIGHT*0.2*menu_index + 8
		if !(sub_menu) {
			draw_sprite_ext(spr_marker, 0, _xx + GUI_WIDTH*0.08, _yy, 2, 2, 90, c_red, 0.75)
		} else {
			draw_set_colour($eeeeee) //off white
			draw_rectangle(_xx + GUI_WIDTH*0.08, _yy - 4, _xx + GUI_WIDTH*0.5, _yy - 1, false)
			draw_sprite_ext(spr_marker, 0, _xx + GUI_WIDTH*0.08, _yy, 4, 4, 90, c_aqua, 1)
		}
		_yy = y
		draw_text_outlined(_xx + GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.4, c_black, c_white, menu_option[state, 0], 4)
		draw_text_outlined(_xx + GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.6, c_black, c_white, menu_option[state, 1], 4)
	break;
	
	case 4: //debug
		draw_text_outlined(_xx + GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.5, c_black, c_white, menu_option[4, 0], 4)
	break;
}