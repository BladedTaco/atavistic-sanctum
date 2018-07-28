/// @description 
var _yy = y
var _xx = x
var _percent = alarm[0]/MENU_DELAY
draw_set_font(fnt_pixel_4)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

switch (round(state)) {
	case 0: //name
	case 1: //controller
		_xx = x + GUI_WIDTH*0.25
		if (_yy = 0) {
			draw_line_width_colour(_xx - GUI_WIDTH*0.2, _yy + (5)*GUI_HEIGHT*0.1, _xx + GUI_WIDTH*0.2, _yy + (5)*GUI_HEIGHT*0.1, 30, c_orange, c_olive)
		}
		for (var i = 0; i < 13; i++) {
			var o = (menu_index + i + array_length_2d(menu_option, round(state))*10 - 6) mod array_length_2d(menu_option, round(state))
			var j = i - 1
			if (o < array_length_2d(menu_option, round(state)) - 2) {
				var _col = c_black	
			} else {
				var _col = c_red
			}
			//make text fit in area
			var l = 4
			var _str = menu_option[round(state), o]
			while ((string_width(_str) >= GUI_WIDTH*0.35) and (l > 1)) {
				switch (l) {
					case 4: draw_set_font(fnt_pixel_3); l = 3; break;
					case 3: draw_set_font(fnt_pixel_2); l = 2; break;
					case 2: draw_set_font(fnt_pixel); l = 1; break;
				}
			}
			//draw the text
			draw_text_outlined(_xx, _yy + (j)*GUI_HEIGHT*0.1 - l - 1, _col, c_white, _str, l)
			draw_line_width_colour(_xx - 50, _yy + (j + 0.5)*GUI_HEIGHT*0.1, _xx + 50, _yy + (j + 0.5)*GUI_HEIGHT*0.1, 5, c_dkgray, c_ltgray)
			draw_set_font(fnt_pixel_4)
		}
		_xx = x
	break;
	
	case 3: //sound
		draw_healthbar(_xx + GUI_WIDTH*0.1, _yy + GUI_HEIGHT*0.45, _xx + GUI_WIDTH*0.4, _yy + GUI_HEIGHT*0.5, global.sound, c_black, c_red, c_white, 0, true, true)
		draw_healthbar(_xx + GUI_WIDTH*0.1, _yy + GUI_HEIGHT*0.65, _xx + GUI_WIDTH*0.4, _yy + GUI_HEIGHT*0.7, global.music, c_black, c_red, c_white, 0, true, true)
	case 2: //rules
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