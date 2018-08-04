/// @description 
var _yy = y
var _xx = x
draw_set_colour($ceafe7)
draw_set_font(fnt_pixel_3)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var j = GUI_HEIGHT*0.075
draw_rectangle(_xx + j, _yy + j, _xx + GUI_WIDTH - j, _yy + GUI_HEIGHT - j + (state == 3)*30, false)

if ((state = 2) or (state = 5)) { //deleting name or controller
	var _i_max = min((menu_index div 20)*20 + 20, array_length_1d(menu_option))
	for (var i = (menu_index div 20)*20; i < _i_max; i++) {
		if (menu_option[i] = "\b") { continue } //skip empty options
		_xx = x + ((i mod 20) div 10)*GUI_WIDTH*0.4 + GUI_WIDTH*0.3
		_yy = y + ((i mod 20) mod 10)*GUI_HEIGHT*0.075 + GUI_HEIGHT*(0.165 + 0.02)
		if (menu_index = i) {
			draw_set_colour($c3f232) //set option selected colour
		} else {
			draw_set_colour($fa63ac) //set base colour
		}
		if (menu_option[i] = "SUCCESSFULLY DELETED.\b") { //draw deleted entries darker
			draw_set_colour(merge_colour(c_black, draw_get_colour(), 0.5))	
		}
		
		//make text fit in area
		var l = 3
		while ((string_width(menu_option[i]) >= GUI_WIDTH*0.35) and (l > 1)) {
			switch (l) {
				case 3: draw_set_font(fnt_pixel_2); l = 2; break;
				case 2: draw_set_font(fnt_pixel); l = 1; break;
			}
		}

		//draw rectangle and text
		draw_rectangle(_xx - GUI_WIDTH*0.175, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.175, _yy + GUI_HEIGHT*0.03, false)
		draw_text_outlined(_xx, _yy - l - 1, c_black, c_white, menu_option[i], l)
		draw_set_font(fnt_pixel_3)
	}
} else { //draw the normal menu
	for (var i = 0; i < array_length_1d(menu_option); i++) {
		if (i < 20)  {
			_xx = x + (i div 10)*GUI_WIDTH*0.6 + GUI_WIDTH*0.2
			_yy = y + (i mod 10)*GUI_HEIGHT*0.075 + GUI_HEIGHT*(0.165 + 0.02)
			draw_set_colour($fa63ac) //set base colour
			if (state = 4) {
				if (i < obj_input.controls_set[player_number] - 2) {
					draw_set_colour($daf324)
				} else if (i = obj_input.controls_set[player_number] - 2) {
					draw_set_colour($21afd4)	
				}
			} else if (state = 3) { //handling a controller
				if (menu_index = i) {
					draw_set_colour($4fa6ae)
				}
			}
			draw_rectangle(_xx - GUI_WIDTH*0.125, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.125, _yy + GUI_HEIGHT*0.03, false)
			draw_text_outlined(_xx, _yy - 4, c_black, c_white, menu_option[i], 3)
		} else {
			_xx = x + ((i - 20) div 10)*GUI_WIDTH*0.6 + GUI_WIDTH*0.2
			_yy = y + ((i - 20) mod 10)*GUI_HEIGHT*0.075 + GUI_HEIGHT*(0.165 + 0.02)	
		}
	
		switch (state) {
			case 0: case 1: //handling a name
				if (i >= 20) {
					if (menu_index = i - 20) {
						draw_set_colour($c3f232)
					} else {
						draw_set_colour($723474)
					}
					if (i < 30) {
						draw_rectangle(_xx + GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.275, _yy + GUI_HEIGHT*0.03, false)
						draw_text_outlined(_xx + GUI_WIDTH*0.2125, _yy - 4, c_black, c_white, string(menu_option[i]), 3)
					} else if (i < 38) {
						draw_rectangle(_xx - GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx - GUI_WIDTH*0.275, _yy + GUI_HEIGHT*0.03, false)
						draw_text_outlined(_xx - GUI_WIDTH*0.2125, _yy - 4, c_black, c_white, string(menu_option[i]), 3)	
					} else {
						draw_set_colour(merge_colour(draw_get_colour(), $f77c2c, 0.65))
						draw_rectangle(_xx - GUI_WIDTH*0.275, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.125, _yy + GUI_HEIGHT*0.03, false)
						draw_text_outlined(_xx - GUI_WIDTH*0.075, _yy - 4, c_black, c_white, string(menu_option[i]), 3)	
					}
				}
			break;
			case 3: //handling a controller
				if (i < 20) {
					if (abs(input_array[i]) > 0.1) {
						draw_set_colour(c_green)
					} else {
						draw_set_colour(c_red)
					}
					if (i < 10) {
						draw_rectangle(_xx + GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.03, false)
						draw_text_outlined(_xx + GUI_WIDTH*0.2, _yy - 4, c_black, c_white, string(input_array[i]), 3)
					} else {
						draw_rectangle(_xx - GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx - GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.03, false)
						draw_text_outlined(_xx - GUI_WIDTH*0.2, _yy - 4, c_black, c_white, string(input_array[i]), 3)
					}
				} else {
					_xx = x + GUI_WIDTH*0.5
					_yy = y + GUI_HEIGHT - j + 5
					if (menu_index = i) {
						draw_set_colour($4fa6ae)
					} else {
						draw_set_colour($fa63ac)
					}
					draw_rectangle(_xx - GUI_WIDTH*0.15, _yy - GUI_HEIGHT*0.03, _xx + GUI_WIDTH*0.15, _yy + GUI_HEIGHT*0.03, false)
					draw_text_outlined(_xx, _yy - 4, c_black, c_white, string(menu_option[i]), 3)
				}
			break;
		}
	}
}
_xx = x
_yy = y

draw_text_outlined(_xx + GUI_WIDTH*0.5, _yy + GUI_HEIGHT*0.105, c_black, c_white, name, 3)

if (state = 4) {
	if (sub_menu) {
		var _str = "IF APPLICABLE\n"
		var j = obj_input.controls_set[player_number]
		switch (j) {
			case 0: _str = "Hold any face button"; break;
			case 1: _str = "Release every button"; break;
			case 18: _str = "Hold L-STICK fully right"; break;
			case 19: _str = "Hold L-STICK fully down"; break;
			case 20: _str += "Hold R-STICK fully right"; break;
			case 21: _str += "Hold R-STICK fully down"; break;
			case 22: _str = "Controls Set."; break;
			default: _str += "Hold " + menu_option[j - 2]; break;
		}
		if (alarm[1] < GAME_SPEED*0.1) { //add a small flash effect when controls are checked
			draw_text_outlined(_xx + GUI_WIDTH*0.5, _yy + GUI_HEIGHT*0.5, c_gray, c_dkgray, _str, 3)
		} else {
			draw_text_outlined(_xx + GUI_WIDTH*0.5, _yy + GUI_HEIGHT*0.5, c_black, c_white, _str, 3)
		}
	} else {
		draw_text_outlined(_xx + GUI_WIDTH*0.5, _yy + GUI_HEIGHT*0.5, c_black, c_white, "PRESS FACE DOWN\nON ANY CONTROLLER\nTO START", 3)
	}
}

/* states
0 - names
1 - add anme
2 - delete name
3 - controller
4 - add controller
5 - delete controller
*/