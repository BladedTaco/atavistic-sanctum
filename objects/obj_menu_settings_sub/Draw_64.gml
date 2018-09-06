/// @description draw menu
//set variables and draw options
var _yy = y
var _xx = x
var _percent = alarm[0]/MENU_DELAY
draw_set_font(fnt_pixel_4)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

switch (round(state)) { //based on state
	case 0: //name
	case 1: //controller
		//
		_xx = x + GUI_WIDTH*0.25
		if (_yy = 0) { //if menu is not moving
			//draw a line behind the selected menu option
			draw_line_width_colour(_xx - GUI_WIDTH*0.2, _yy + (5)*GUI_HEIGHT*0.1, _xx + GUI_WIDTH*0.2, _yy + (5)*GUI_HEIGHT*0.1, 30, c_orange, c_olive)
		}
		for (var i = 0; i < 13; i++) { //loop to fill the entire screen
			//get the menu option identifier
			var o = (menu_index + i + array_length_2d(menu_option, round(state))*10 - 6) mod array_length_2d(menu_option, round(state))
			var j = i - 1
			if (o < array_length_2d(menu_option, round(state)) - 2) { //creating or deleting option
				var _col = c_black //set colour to black
			} else { //selecing a proper option
				var _col = c_red //set colour to red
			}
			//make text fit in area
			var l = 4 //the font size
			var _str = menu_option[round(state), o] //get the menu option text
			while ((string_width(_str) >= GUI_WIDTH*0.35) and (l > 1)) { //while it does not fit its container
				switch (l) { //decrease the font size by 1
					case 4: draw_set_font(fnt_pixel_3); l = 3; break;
					case 3: draw_set_font(fnt_pixel_2); l = 2; break;
					case 2: draw_set_font(fnt_pixel); l = 1; break;
				}
			}
			//draw the menu option background and text
			draw_text_outlined(_xx, _yy + (j)*GUI_HEIGHT*0.1 - l - 1, _col, c_white, _str, l)
			draw_line_width_colour(_xx - 50, _yy + (j + 0.5)*GUI_HEIGHT*0.1, _xx + 50, _yy + (j + 0.5)*GUI_HEIGHT*0.1, 5, c_dkgray, c_ltgray)
			draw_set_font(fnt_pixel_4) //reset draw font
		}
		_xx = x
	break;
	
	case 3: //sound
		//draw sliders to show the levels of sound and music
		draw_healthbar(_xx + GUI_WIDTH*0.1, _yy + GUI_HEIGHT*0.45, _xx + GUI_WIDTH*0.4, _yy + GUI_HEIGHT*0.5, global.sound, c_black, c_red, c_white, 0, true, true)
		draw_healthbar(_xx + GUI_WIDTH*0.1, _yy + GUI_HEIGHT*0.65, _xx + GUI_WIDTH*0.4, _yy + GUI_HEIGHT*0.7, global.music, c_black, c_red, c_white, 0, true, true)
	case 2: //rules
		//get vertical position
		_yy = y + GUI_HEIGHT*0.4 + GUI_HEIGHT*0.2*menu_index + 8
		if !(sub_menu) { //if not in a sub menu
			//draw menu option selector marker
			draw_sprite_ext(spr_marker, 0, _xx + GUI_WIDTH*0.08, _yy, 2, 2, 90, c_red, 0.75)
		} else { //in a sub menu
			draw_set_colour($eeeeee) //off white colour
			//draw marker and a line behind the text
			draw_rectangle(_xx + GUI_WIDTH*0.08, _yy - 4, _xx + GUI_WIDTH*0.5, _yy - 1, false)
			draw_sprite_ext(spr_marker, 0, _xx + GUI_WIDTH*0.08, _yy, 4, 4, 90, c_aqua, 1)
		}
		_yy = y
		//draw the menu option text
		draw_text_outlined(_xx + GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.4, c_black, c_white, menu_option[state, 0], 4)
		draw_text_outlined(_xx + GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.6, c_black, c_white, menu_option[state, 1], 4)
	break;
	
	case 4: //debug
		//draw the menu option text
		draw_text_outlined(_xx + GUI_WIDTH*0.25, _yy + GUI_HEIGHT*0.5, c_black, c_white, menu_option[4, 0], 4)
	break;
}